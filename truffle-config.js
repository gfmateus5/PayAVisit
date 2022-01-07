module.exports = {
  networks: {
     development: {
      host: "192.168.1.71",     // Localhost (default: none)
      port: 7545,            // Standard Ethereum port (default: none)
      network_id: "*",       // Any network (default: none)
     },
   },
    contracts_build_directory: "./src/artifacts/",
  // Configure your compilers
  compilers: {
    solc: {
        optimizer: {
          enabled: true,
          runs: 200
        },
    }
  }
};