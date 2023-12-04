-- ToneMap pega o valor linear da Convar mat_hdr_tonemapscale
matproxy.Add( {
   name = "ToneMap",

   init = function( self, mat, values )
      self.ResultXYZ = values.resultvar
   end,

   bind = function( self, mat, ent ) -- TODO: lower ticks
      if not (IsValid( ent )) then return end

      local XYZ = render.GetToneMappingScaleLinear()
      local R = XYZ.x * 1.5127
      local G = XYZ.y * 1.4413
      local B = XYZ.z * 2.2651

      mat:SetVector( self.ResultXYZ, Vector( R, G, B ) )

   end
} )
