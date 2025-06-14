-- JDTLS (Java LSP) configuration
local home = vim.env.HOME -- Get the home directory

local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local system_os = "mac" -- macOS by default

-- Java installation path
-- local java_cmd = "/opt/homebrew/opt/openjdk@23/bin/java"
-- local java_cmd = "/Library/Java/JavaVirtualMachines/jdk-24.jdk/Contents/Home/bin/java"
local java_cmd = "/Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home/bin/java"
-- local java_cmd = "/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/bin/java"

-- JavaFX
local jfx_jar = "/Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home/lib/javafx-swt.jar"


-- JDTLS installation path (for Mason)
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = jdtls_path .. "/config_" .. system_os

-- Define workspace location for JDTLS
local workspace_path = home .. "/.cache/jdtls/workspace/" .. project_name
local function uri_encode(path)
  return path:gsub(" ", "%%20")
end

local config = {
    cmd = {
        java_cmd,
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx4g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-cp",
        table.concat({
            "/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/lib/ext/jfxrt.jar",
            "src"
        }, ":"),
        "-jar", launcher_jar,  -- Use glob to dynamically find the launcher
        "-configuration", config_path,
        "-data", workspace_path, -- Set workspace
    },

    -- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),
    root_dir = vim.fn.getcwd(),

    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            signatureHelp = { enabled = true },
            format = {
                enabled = true,
            },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                importOrder = {
                    "java",
                    "javax",
                    "com",
                    "org",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
        },
    },

    -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
    flags = {
        allow_incremental_sync = true,
    },
    init_options = {
        bundles = {},
    },
}

config["on_attach"] = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
end

-- Start JDTLS
jdtls.start_or_attach(config)

-- Windows
-- -- JDTLS (Java LSP) configuration
-- local home = vim.env.HOME -- Get the home directory
--
-- local jdtls = require("jdtls")
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
--
-- local system_os = ""
--
-- -- Determine OS
-- if vim.fn.has("mac") == 1 then
--   system_os = "mac"
-- elseif vim.fn.has("unix") == 1 then
--   system_os = "linux"
-- elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
--   system_os = "win"
-- else
--   print("OS not found, defaulting to 'linux'")
--   system_os = "linux"
-- end
--
-- -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- local config = {
--   -- The command that starts the language server
--   -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--   cmd = {
--     "C:/Program Files/Java/jdk-21/bin/java.exe",
--     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--     "-Dosgi.bundles.defaultStartLevel=4",
--     "-Declipse.product=org.eclipse.jdt.ls.core.product",
--     "-Dlog.protocol=true",
--     "-Dlog.level=ALL",
--     "-Xmx4g",
--     "--add-modules=ALL-SYSTEM",
--     "--add-opens", "java.base/java.util=ALL-UNNAMED",
--     "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--
--     -- Eclipse jdtls location
--     "-jar",
--     vim.fn.expand("~/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"),
--     "-configuration",
--     home .. "/AppData/Local/nvim-data/mason/packages/jdtls/config_" .. system_os,
--     "-data",
--     'D:/OneDrive - UTS/Project' .. project_name,
--   },
--
--   -- This is the default if not provided, you can remove it. Or adjust as needed.
--   -- One dedicated LSP server & client will be started per unique root_dir
--   root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),
--
--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   settings = {
--     java = {
--       -- TODO Replace this with the absolute path to your main java version (JDK 17 or higher)
--       eclipse = {
--         downloadSources = true,
--       },
--       configuration = {
--         updateBuildConfiguration = "interactive",
--         -- TODO Update this by adding any runtimes that you need to support your Java projects and removing any that you don't have installed
--         -- The runtime name parameters need to match specific Java execution environments.  See https://github.com/tamago324/nlsp-settings.nvim/blob/2a52e793d4f293c0e1d61ee5794e3ff62bfbbb5d/schemas/_generated/jdtls.json#L317-L334
--       },
--       maven = {
--         downloadSources = true,
--       },
--       implementationsCodeLens = {
--         enabled = true,
--       },
--       referencesCodeLens = {
--         enabled = true,
--       },
--       references = {
--         includeDecompiledSources = true,
--       },
--       signatureHelp = { enabled = true },
--       format = {
--         enabled = true,
--         -- Formatting works by default, but you can refer to a specific file/URL if you choose
--         -- settings = {
--         --   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
--         --   profile = "GoogleStyle",
--         -- },
--       },
--       completion = {
--         favoriteStaticMembers = {
--           "org.hamcrest.MatcherAssert.assertThat",
--           "org.hamcrest.Matchers.*",
--           "org.hamcrest.CoreMatchers.*",
--           "org.junit.jupiter.api.Assertions.*",
--           "java.util.Objects.requireNonNull",
--           "java.util.Objects.requireNonNullElse",
--           "org.mockito.Mockito.*",
--         },
--         importOrder = {
--           "java",
--           "javax",
--           "com",
--           "org",
--         },
--       },
--       sources = {
--         organizeImports = {
--           starThreshold = 9999,
--           staticStarThreshold = 9999,
--         },
--       },
--       codeGeneration = {
--         toString = {
--           template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
--         },
--         useBlocks = true,
--       },
--     },
--   },
--   -- Needed for auto-completion with method signatures and placeholders
--   capabilities = require("cmp_nvim_lsp").default_capabilities(),
--   flags = {
--     allow_incremental_sync = true,
--   },
--   init_options = {
--     -- References the bundles defined above to support Debugging and Unit Testing
--     bundles = {},
--   },
-- }
--
-- -- Needed for debugging
-- config["on_attach"] = function(client, bufnr)
--   jdtls.setup_dap({ hotcodereplace = "auto" })
--   require("jdtls.dap").setup_dap_main_class_configs()
-- end
--
-- -- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
-- jdtls.start_or_attach(config)
