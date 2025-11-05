import { app } from "@azure/functions";
import { Client } from "@microsoft/microsoft-graph-client";

export interface ProvisionPayload {
  firstName: string;
  lastName: string;
  personalEmail: string;
  managerUpn: string;
  role: "Employee" | "Contractor" | "Intern";
  department?: string;
  startDate: string; // ISO
  correlationId: string;
}

function getGraphClient(token: string) {
  return Client.init({
    authProvider: done => done(null, token),
  });
}

export const provision = app.http("provision", {
  methods: ["POST"],
  authLevel: "function",
  handler: async (req, ctx) => {
    const payload = (await req.json()) as ProvisionPayload;
    const token = process.env.GRAPH_TOKEN ?? "";
    const graph = getGraphClient(token);

    const upn = `${payload.firstName}.${payload.lastName}`.toLowerCase() + "@example.com";
    // 1) Create user
    // 2) Assign license (verify pool)
    // 3) Add to security groups based on role/department

    // TODO: implement Graph calls; write to App Insights with correlationId
    return { body: JSON.stringify({ upn, correlationId: payload.correlationId }) };
  },
});

export const rollback = app.http("rollback", {
  methods: ["POST"],
  authLevel: "function",
  handler: async (req, ctx) => {
    const { upn, groups, siteId, correlationId } = await req.json();
    // TODO: disable user, remove license, remove groups, delete site
    return { body: JSON.stringify({ rolledBack: true, correlationId }) };
  },
});
