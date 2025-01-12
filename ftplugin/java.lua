local jdtls = require('jdtls')
jdtls.start_or_attach({
	cmd = { vim.fn.stdpath('data') .. '/mason/bin/jdtls.cmd' },
	root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
})
