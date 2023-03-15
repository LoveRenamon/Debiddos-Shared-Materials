-- Add/Enables ConVar proxie that misbehave or doesnt exist in GMod
matproxy.Add({
    name = "ConVar",

    init = function(self, mat, values)
        self.cvar = values.convar
        self.ResultTo = values.resultvar
    end,

    bind = function(self, mat, ent)

        local cvar = GetConVar( self.cvar )

        if not IsValid(cvar) then
            return
        end

        mat:SetVector(self.ResultTo, cvar:GetFloat() )

    end
})
