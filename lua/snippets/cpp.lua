local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
    -- Competitive Programming Template
    s("cp", fmt([[
        #include <iostream>
        /*#define int long long*/

        using namespace std;

        void solve() {{
            {}
        }}

        signed main() {{
            ios_base::sync_with_stdio(false);
            cin.tie(nullptr);

            int t = 1;
            // cin >> t;
            while (t--) {{
                solve();
                cout << '\n';
            }}

            return 0;
        }}
    ]], { i(1, "// Your code here") })),
})

