-- ToneMap pegar o valor linear da Convar mat_hdr_tonemapscale
matproxy.Add( {
   name = "ToneMap",

   init = function( self, mat, values )
      self.ResultXYZ = values.resultvar
      -- self.ResultFloat = values.float
   end,

   bind = function( self, mat, ent )
      if not (IsValid( ent )) then return end

      local XYZ = render.GetToneMappingScaleLinear()
      -- local LF = XYZ * 0.0625
      local R = XYZ.x * 1.5127
      local G = XYZ.y * 1.4413
      local B = XYZ.z * 2.2651

      mat:SetVector( self.ResultXYZ, Vector( R, G, B ) )
      -- mat:SetFloat( self.ResultFloat, XYZ.x )

   end
} )
