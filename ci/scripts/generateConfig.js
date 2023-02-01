#! /usr/bin/env node

// `generateConfig.js` is run by Github CI to create configuration file
// for an environment.

const yaml = require('js-yaml');
const fs = require('fs');

try {
  const doc = yaml.load(fs.readFileSync('config.sample.yaml', 'utf8'));

  // An extremely simple config generator.
  // TODO: Build a better solution when there are more variables to replace.
  doc.endpoint = process.env.HASURA_ENDPOINT;
  doc.admin_secret = process.env.HASURA_ADMIN_SECRET;

  // saving file back as YAML
  const config = yaml.dump(doc);
  fs.writeFileSync('config.yaml', config);

} catch (e) {
  console.log(e);
}
