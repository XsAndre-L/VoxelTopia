import { resolve } from "bun";

async function getInput(message: string) {
  process.stdout.write(message);
  // const input = await new Response(Bun.stdin).text();
  // return input.trim();

  return new Promise<string>((resolve) =>
    process.stdin.once("data", (data) => {
      resolve(data.toString().trim());
    })
  );
}

const runCmd = async (cmd: string) => {
  const proc = Bun.spawn(["sh", "-c", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  if (await proc.exited) throw new Error(`Command failed: ${cmd}`);
};

const main = async () => {
  try {
    // await runCmd("ls");
    await runCmd("sh ./manager/cmd/install_tools.sh");

    const answer = await getInput("Tooling installed type Y to continue: ");
    if (answer?.trim().toLowerCase() === "y")
      await runCmd("sh ./manager/cmd/setup.sh");
    else console.log("Setup aborted.");
  } catch (err) {
    console.error(err);
  } finally {
    process.exit(0); // Ensure the process exits after completion
  }
};

main();
