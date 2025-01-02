function Status:render(area)
	self.area = area

	local line = ui.Line { self:percentage(), self:position() }
	return {
		ui.Paragraph(area, { line }):align(ui.Paragraph.CENTER),
	}
end
-- Paneles dinámicos dependiendo de las dimensiones de los paneles
function Tab:layout()
    if self._area.w < 30 then
        -- Only show the current pane
        self._chunks =
            ui.Layout():direction(ui.Layout.HORIZONTAL):constraints(
            {
                ui.Constraint.Ratio(0, MANAGER.ratio.all),
                ui.Constraint.Ratio(8, MANAGER.ratio.all),
                ui.Constraint.Ratio(0, MANAGER.ratio.all)
            }
        ):split(self._area)
    elseif self._area.w < 80 then
        -- Show the current and parent panes
        self._chunks =
            ui.Layout():direction(ui.Layout.HORIZONTAL):constraints(
            {
                ui.Constraint.Ratio(0, MANAGER.ratio.all),
                ui.Constraint.Ratio(MANAGER.ratio.current, MANAGER.ratio.all),
                ui.Constraint.Ratio(MANAGER.ratio.preview, MANAGER.ratio.all)
            }
        ):split(self._area)
    else
        -- Show all panes
        self._chunks =
            ui.Layout():direction(ui.Layout.HORIZONTAL):constraints(
            {
                ui.Constraint.Ratio(MANAGER.ratio.parent, MANAGER.ratio.all),
                ui.Constraint.Ratio(MANAGER.ratio.current, MANAGER.ratio.all),
                ui.Constraint.Ratio(MANAGER.ratio.preview, MANAGER.ratio.all)
            }
        ):split(self._area)
    end
end
