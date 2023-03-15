-- AnimeTone pegar o valor de Ambient Color e faz umas gambiarra
matproxy.Add( {

   name = "AnimeTone",

   init = function( self, mat, values )
      -- self.XYZ = Vector()
      -- self.ResultFloat = values.float
      -- self.ResultVar = values.resultvar
   end,

   bind = function( self, mat, ent )
      if not (IsValid( ent )) then return end

      local XYZ = render.GetToneMappingScaleLinear()
      local Tone = render.GetLightColor( ent:GetPos() )
      -- print("\n\nXYZ is:")
      -- print(Tone)

      -- local LF = Tone * 0.0625

      -- fasteast fixup aproximation for color temperature
      local R = Tone.x * 0.80787
      local G = Tone.y * 0.80775
      local B = Tone.z * 0.80784
      -- sorta of gamma correction inspired on Gamut but we'll use only red (hot) color
      if R <= 0.125490196 then
         -- print("RGB <= 32 || Case A too dark great boost")
         local R = R * 32 + Tone.x
         local G = G * 32 + Tone.y
         local B = B * 32 + Tone.z
      elseif R <= 0.250980392 then
         -- print("RGB <= 64 || || Case B still dark boost")
         local R = R * 16 + Tone.x
         local G = G * 16 + Tone.y
         local B = B * 16 + Tone.z
      elseif R >= 0.34 then
         -- print("RGB >= 102 || Case C too much energy, decrease again")
         local R = R * 0.799
         local G = G * 0.801
         local B = B * 0.805
      elseif R >= 0.250980392 then
         -- print("RGB >= 64 || Case D looks almost good, boost")
         local R = R * 2 + Tone.x * 0.5
         local G = G * 2 + Tone.y * 0.5
         local B = B * 2 + Tone.z * 0.5
      end

      local RGB = Vector( R, G, B )

      local Color = Vector( 1-R, 1-G, 1-B )
      local RGBMin = 0.8

      -- FIXME: find better method to clamp RGBMin
      local tmp = XYZ.x --math.pow( Tone.x, 4 )
      local R = R + RGBMin + tmp
      local R = R / 2 --3
      local G = G + RGBMin + tmp
      local G = G / 2 --3
      local B = B + RGBMin + tmp
      local B = B / 2 --3

      -- Should I hardcode Clamp?
      -- local R = math.Clamp( Color.x, RGBmin, 1.8 )
      -- local G = math.Clamp( Color.y, RGBmin, 1.8 )
      -- local B = math.Clamp( Color.z, RGBmin, 1.8 )
      local Color2 = Vector( R, G, B )

      local Emissive = Vector( Color.x * 0.25, Color.y * 0.25, Color.z * 0.25 )

      -- print("RGB is:")
      -- print(RGB)
      -- print("\n$color2 is:")
      -- print(Color2)
      -- print("\n$AnimeEmissive is:")
      -- print(Emissive)
      -- print(math.Round(R*255), math.Round(G*255), math.Round(B*255))

      mat:SetVector( "$color2", Color2 )
      mat:SetVector( "$envmaptint", RGB )
      mat:SetVector( "$AnimeEmissive", Emissive )
      -- mat:SetFloat( self.ResultFloat, XYZ.x )
      -- mat:SetVector( self.Resultvar, XYZ )

   end
} )