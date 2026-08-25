-- Remove speaker notes (`::: {.notes}` divs) from the rendered deck unless the document
-- metadata sets `keep-notes: true`. The public site build leaves it false; the instructor
-- profile (`_quarto-instructor.yml`) sets it true. Notes therefore live in the same source
-- file as the slides without ever reaching the published HTML -- and
-- `tools/lint_no_instructor_content.py` fails the site build if an `<aside class="notes">`
-- ever does.
local keep = false

local function truthy(v)
  if v == nil then return false end
  if type(v) == "boolean" then return v end
  return pandoc.utils.stringify(v) == "true"
end

return {
  { Meta = function(m) keep = truthy(m["keep-notes"]) end },
  { Div = function(el)
      if not keep and el.classes:includes("notes") then return {} end
    end },
}
