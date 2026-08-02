#!/usr/bin/env node
// Thin launcher: exec the platform binary downloaded by install.js.
const { spawnSync } = require("child_process");
const path = require("path");
const fs = require("fs");

const binName = process.platform === "win32" ? "hipmmcode.exe" : "hipmmcode";
const bin = path.join(__dirname, "..", "dist", binName);
if (!fs.existsSync(bin)) {
  console.error("hipmmcode binary missing — reinstall: npm install -g @hipmmai/hipmmcode");
  process.exit(1);
}
const r = spawnSync(bin, process.argv.slice(2), { stdio: "inherit" });
process.exit(r.status === null ? 1 : r.status);
