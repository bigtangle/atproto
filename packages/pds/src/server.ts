import { envToCfg, envToSecrets, readEnv } from './config'
import PDS from './index'

async function main() {
  console.log('Starting PDS server...')
  try {
    const env = readEnv()
    const cfg = envToCfg(env)
    const secrets = envToSecrets(env)
    const pds = await PDS.create(cfg, secrets)
    await pds.start()
    console.log(`PDS server running at ${cfg.service.publicUrl}`)
  } catch (err) {
    console.error('Failed to start PDS server:', err)
    process.exit(1)
  }
}

main()
