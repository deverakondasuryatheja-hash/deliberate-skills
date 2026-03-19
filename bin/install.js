#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const readline = require('readline');

const SKILLS = ['deliberate-plan', 'deliberate-execute'];
const ARGS = process.argv.slice(2);

const isGlobal = ARGS.includes('--global') || ARGS.includes('-g');
const isLocal = ARGS.includes('--local') || ARGS.includes('-l');
const isUninstall = ARGS.includes('--uninstall');

function getDestDir(global) {
  if (global) {
    const home = process.env.HOME || process.env.USERPROFILE;
    return path.join(home, '.claude', 'skills');
  }
  return path.join(process.cwd(), '.claude', 'skills');
}

function copyDir(src, dest) {
  fs.mkdirSync(dest, { recursive: true });
  for (const entry of fs.readdirSync(src, { withFileTypes: true })) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);
    if (entry.isDirectory()) {
      copyDir(srcPath, destPath);
    } else {
      fs.copyFileSync(srcPath, destPath);
    }
  }
}

async function main() {
  console.log('\n  🎯 Deliberate Skills Installer\n');
  console.log('  The deepest planning + most disciplined execution for Claude Code.\n');

  let global = isGlobal;

  if (!isGlobal && !isLocal) {
    const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
    const answer = await new Promise(resolve => {
      rl.question('  Install globally (all projects) or locally (this project)? [g/l]: ', resolve);
    });
    rl.close();
    global = answer.trim().toLowerCase().startsWith('g');
  }

  const destDir = getDestDir(global);
  const skillsDir = path.join(__dirname, '..', 'skills');

  if (isUninstall) {
    for (const skill of SKILLS) {
      const dest = path.join(destDir, skill);
      if (fs.existsSync(dest)) {
        fs.rmSync(dest, { recursive: true });
        console.log(`  ✅ Removed ${skill}`);
      }
    }
    console.log('\n  Deliberate Skills uninstalled.\n');
    return;
  }

  for (const skill of SKILLS) {
    const src = path.join(skillsDir, skill);
    const dest = path.join(destDir, skill);
    
    if (fs.existsSync(dest)) {
      console.log(`  ⚠️  ${skill} exists — overwriting`);
      fs.rmSync(dest, { recursive: true });
    }
    
    copyDir(src, dest);
    console.log(`  ✅ Installed ${skill} → ${dest}`);
  }

  console.log(`\n  🎉 Done! Restart Claude Code, then try:\n`);
  console.log(`     "plan the booking system"     → triggers deliberate-plan`);
  console.log(`     "execute this plan"            → triggers deliberate-execute`);
  console.log(`     "quick fix the login bug"      → triggers quick mode\n`);
}

main().catch(err => {
  console.error('Install failed:', err.message);
  process.exit(1);
});
