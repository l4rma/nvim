local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("all", {
	-- Insert a full week for work todos
	s("newWeek", {
		t({"## " }),
		t(os.date("%Y-%m-%d", os.time()+4*24*60*60)),
		t({" - Fredag", ""}),
		t({"* [ ] Føre timer i PowerOffice", ""}),
		t({"* [ ] Føre timer i Timetracker", "", ""}),

		t({"## " }),
		t(os.date("%Y-%m-%d", os.time()+3*24*60*60)),
		t({" - Torsdag", ""}),
		t({"* [ ] ", "", ""}),
		
		t({"## " }),
		t(os.date("%Y-%m-%d", os.time()+2*24*60*60)),
		t({" - Onsdag", ""}),
		t({"* [ ] ", "", ""}),

		t({"## " }),
		t(os.date("%Y-%m-%d", os.time()+1*24*60*60)),
		t({" - Tirsdag", ""}),
		t({"* [ ] ", "", ""}),

		t({"## " }),
		t(os.date("%Y-%m-%d")),
		t({" - Mandag", ""}),
		t({"* [ ] "}),
		i(0),
	}),
	s("dato", {
		t(os.date("%d.%m.%y")),
		i(0),
	})
})
