local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
    -- 標題
    s("#", { t("\\section*{"), i(1, ""), t("}") }, { wordTrig = false }),
    s("##", { t("\\subsection*{"), i(1, ""), t("}") }, { wordTrig = false }),
    s("##", { t("\\subsubsection*{"), i(1, ""), t("}") }, { wordTrig = false }),
    s("*", { t("\\textit{"), i(1, ""), t("}") }, { wordTrig = false }),
    s("**", { t("\\textbf{"), i(1, ""), t("}") }, { wordTrig = false }),



		-- 數學模式
    s("f", { t("\\frac{"), i(1, ""), t("}{"), i(2, ""), t("}") }, { wordTrig = false }),
    s("int", { t("\\int_{"), i(1, ""), t("}^{"), i(2, ""), t("}"), i(3, "") }, { wordTrig = false }),
		s("oint", { t("\\oint_{"), i(1, ""), t("}"), i(2, "") }, { wordTrig = false }),
		s("sum", { t("\\sum_{"), i(1, ""), t("}^{"), i(2, ""), t("}"), i(3, "") }, { wordTrig = false }),
    s("\\t", { t("\\text{"), i(1, ""), t("}") }, { wordTrig = false }),
		s("vec", { t("\\vec{"), i(1, ""), t("}") }, { wordTrig = false }),
		s("ome-",{ t("\\omega_{"), i(1, ""), t("}") }, { wordTrig = false }),
		s("d", { t("\\mathrm{d}") }, { wordTrig = false }),
		s("ome", { t("\\omega") }, { wordTrig = false }),
		s("the", { t("\\theta") }, { wordTrig = false }),
		s("lam", { t("\\lambda") }, { wordTrig = false }),
		s("sig", { t("\\sigma") }, { wordTrig = false }),
		s("Del", { t("\\Delta") }, { wordTrig = false }),
		s("phi", { t("\\phi") }, { wordTrig = false }),
		s("alp", { t("\\alpha") }, { wordTrig = false }),
		s("bet", { t("\\beta") }, { wordTrig = false }),
		s("gam", { t("\\gamma") }, { wordTrig = false }),
		s("del", { t("\\delta") }, { wordTrig = false }),
		s("pi", { t("\\pi") }, { wordTrig = false }),
		s("grad", { t("\\nabla") }, { wordTrig = false }),
		s("curl", { t("\\nabla \\times ") }, { wordTrig = false }),
		s("div", { t("\\nabla \\cdot ") }, { wordTrig = false }),
		s("inf", { t("\\infty") }, { wordTrig = false }),

		s("|", { t("\\left| "), i(1, ""), t(" \\right| ") }, { wordTrig = false }),

    s("^", { t("^{"), i(1), t("}") }),
    s("-", { t("_{"), i(1), t("}") }),

    -- begin ... end
    s("be", {
        t("\\begin{"), i(1, ""), t("}"), t({ "", "\t" }), i(2, ""),
        t({ "", "\\end{" }), i(1, ""), t("}" )
    }),

    -- align 環境
    s("align", {
        t("\\begin{align*}"), t({ "", "\t" }), i(1, ""), t({ "", "\\end{align*}" })
    }),

    -- enumerate
    s("item", {
        t({ "\\begin{enumerate}[label=\\arabic*.]", "" }),
        t({ "\t\\item " }), i(1, ""),
        t({ "", "\\end{enumerate}" })
    }),

    -- minipage
    s("minipage", {
        t("\\begin{minipage}{"), i(1, "0.6\\textwidth"), t("}"),
        t({ "", "\t" }), i(2, ""),
        t({ "", "\\end{minipage}" })
    }),
})
