//--------------------------------------------------------------
//              Sunao Shader Core
//                      Copyright (c) 2021 揚茄子研究所
//--------------------------------------------------------------


//-------------------------------------Include

	#include "UnityCG.cginc"
	#include "AutoLight.cginc"
	#include "Lighting.cginc"
	#include "SunaoShader_Macro.cginc"
	#include "SunaoShader_Function.cginc"

//-------------------------------------変数宣言

//----Main
	UNITY_DECLARE_TEX2D(_MainTex);
	uniform float4    _MainTex_ST;
	uniform float4    _Color;
	uniform float     _Cutout;
	uniform float     _Alpha;
	uniform sampler2D _BumpMap;
	uniform float4    _BumpMap_ST;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
	UNITY_DECLARE_TEX2D_NOSAMPLER(_AlphaMask);
	uniform float     _Bright;
	uniform float     _BumpScale;
	uniform float     _OcclusionStrength;
	uniform float     _OcclusionMode;
	uniform float     _AlphaMaskStrength;
	uniform bool      _VertexColor;
	uniform float     _UVScrollX;
	uniform float     _UVScrollY;
	uniform float     _UVAnimation;
	uniform uint      _UVAnimX;
	uniform uint      _UVAnimY;
	uniform bool      _UVAnimOtherTex;
	uniform bool      _DecalEnable;
	uniform sampler2D _DecalTex;
	uniform float4    _DecalTex_TexelSize;
	uniform float4    _DecalColor;
	uniform float     _DecalPosX;
	uniform float     _DecalPosY;
	uniform float     _DecalSizeX;
	uniform float     _DecalSizeY;
	uniform float     _DecalRotation;
	uniform uint      _DecalMode;
	uniform uint      _DecalMirror;
	uniform float     _DecalScrollX;
	uniform float     _DecalScrollY;
	uniform float     _DecalAnimation;
	uniform uint      _DecalAnimX;
	uniform uint      _DecalAnimY;

//----Tangents
	uniform bool      _TanEnable;
	uniform uint      _TanMode;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_TanMap);
	uniform float4    _TanMap_ST;

//----Shading & Lighting
	UNITY_DECLARE_TEX2D_NOSAMPLER(_ShadeMask);
	uniform float     _Shade;
	uniform float     _ShadeWidth;
	uniform float     _ShadeGradient;
	uniform float     _ShadeColor;
	uniform float4    _CustomShadeColor;
	uniform bool      _ToonEnable;
	uniform uint      _Toon;
	uniform float     _ToonSharpness;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_LightMask);
	uniform float     _LightBoost;
	uniform float     _Unlit;
	uniform bool      _MonochromeLit;

//----Mirror control
	uniform bool      _MirrorControlEnable;
	uniform float     _MirrorCopyAlpha;
	uniform float     _RealCopyAlpha;

//----Hue Shift
	uniform bool      _HSVShiftEnable;
	UNITY_DECLARE_TEX2D(_HSVShiftMask);
	uniform float4 		_HSVShiftMask_ST;
	uniform float 		_HSVShiftHue;
	uniform float 		_HSVShiftSat;
	uniform float 		_HSVShiftVal;
	uniform uint 		  _HSVShiftBaseMode;
	uniform uint 		  _HSVShiftDecalMode;
	uniform uint 		  _HSVShiftShadeMode;
	uniform uint 		  _HSVShiftSpecularMode;
	uniform uint 		  _HSVShiftEmissionMode;
	uniform uint 		  _HSVShiftOutlineMode;
	uniform uint 		  _HSVShiftRimMode;
	uniform uint 		  _HSVShiftParallaxMode;
	uniform uint 		  _HSVShiftStippleMode;
	uniform uint 		  _HSVShiftCrosshatchMode;

//----Stippling & Crosshatching
	uniform bool      _StippleEnable;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_StippleMask);
	uniform float4 		_StippleMask_ST;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_StippleTexture);
	uniform float4    _StippleTexture_ST;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_StippleEmissionMap);
	uniform float4    _StippleEmissionMap_ST;
	uniform float 		_StippleSize;
	uniform float 		_StippleAmount;
	uniform uint 		  _StippleMode;
	uniform float 		_StippleAnimation;
	uniform float 		_StippleSpeed;
	uniform float 		_StippleFrequency;
	uniform bool      _StippleDisableOutline;
	uniform bool      _CrosshatchEnable;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_CrosshatchMask);
	uniform float4 		_CrosshatchMask_ST;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_CrosshatchTexture);
	uniform float4 		_CrosshatchTexture_ST;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_CrosshatchEmissionMap);
	uniform float4    _CrosshatchEmissionMap_ST;
	uniform float 		_CrosshatchAmount;

//----Vertex Color Alpha
	uniform float     _VertexColorThreshold;
	uniform float3    _VertexColor01;
	uniform float     _VertexAlpha01;
	uniform float3    _VertexColor02;
	uniform float     _VertexAlpha02;
	uniform float3    _VertexColor03;
	uniform float     _VertexAlpha03;
	uniform float3    _VertexColor04;
	uniform float     _VertexAlpha04;
	uniform float3    _VertexColor05;
	uniform float     _VertexAlpha05;
	uniform float3    _VertexColor06;
	uniform float     _VertexAlpha06;
	uniform float3    _VertexColor07;
	uniform float     _VertexAlpha07;
	uniform float3    _VertexColor08;
	uniform float     _VertexAlpha08;
	uniform float3    _VertexColor09;
	uniform float     _VertexAlpha09;
	uniform float3    _VertexColor10;
	uniform float     _VertexAlpha10;
	uniform float3    _VertexColor11;
	uniform float     _VertexAlpha11;
	uniform float3    _VertexColor12;
	uniform float     _VertexAlpha12;
	uniform float3    _VertexColor13;
	uniform float     _VertexAlpha13;
	uniform float3    _VertexColor14;
	uniform float     _VertexAlpha14;
	uniform float3    _VertexColor15;
	uniform float     _VertexAlpha15;
	uniform float3    _VertexColor16;
	uniform float     _VertexAlpha16;

//----Emission
	uniform bool      _EmissionEnable;
	uniform sampler2D _EmissionMap;
	uniform float4    _EmissionMap_ST;
	uniform float4    _EmissionColor;
	uniform float     _Emission;
	uniform sampler2D _EmissionMap2;
	uniform float4    _EmissionMap2_ST;
	uniform uint      _EmissionMode;
	uniform float     _EmissionBlink;
	uniform float     _EmissionFrequency;
	uniform uint      _EmissionWaveform;
	uniform float     _EmissionScrX;
	uniform float     _EmissionScrY;
	uniform float     _EmissionAnimation;
	uniform uint      _EmissionAnimX;
	uniform uint      _EmissionAnimY;
	uniform bool      _EmissionLighting;
	uniform bool      _IgnoreTexAlphaE;
	uniform float     _EmissionInTheDark;

//----Parallax Emission
	uniform bool      _ParallaxEnable;
	uniform sampler2D _ParallaxMap;
	uniform float4    _ParallaxMap_ST;
	uniform float4    _ParallaxColor;
	uniform float     _ParallaxEmission;
	uniform float     _ParallaxDepth;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_ParallaxDepthMap);
	uniform float4    _ParallaxDepthMap_ST;
	uniform sampler2D _ParallaxMap2;
	uniform float4    _ParallaxMap2_ST;
	uniform uint      _ParallaxMode;
	uniform float     _ParallaxBlink;
	uniform float     _ParallaxFrequency;
	uniform uint      _ParallaxWaveform;
	uniform float     _ParallaxPhaseOfs;
	uniform float     _ParallaxScrX;
	uniform float     _ParallaxScrY;
	uniform float     _ParallaxAnimation;
	uniform uint      _ParallaxAnimX;
	uniform uint      _ParallaxAnimY;
	uniform bool      _ParallaxLighting;
	uniform bool      _IgnoreTexAlphaPE;
	uniform float     _ParallaxInTheDark;

//----Toon Specular
	uniform bool      _ToonSpecEnable;
	uniform uint      _ToonSpecMode;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_ToonSpecMask);
  uniform float4    _ToonSpecMask_ST;
	uniform float4    _ToonSpecColor;
	uniform float     _ToonSpecMetallic;
	uniform float     _ToonSpecIntensity;
  uniform float     _ToonSpecRoughnessT;
	uniform float     _ToonSpecRoughnessB;
  uniform float     _ToonSpecOffset;
	uniform float     _ToonSpecSharpness;

//----Reflection
	uniform bool      _ReflectionEnable;
	uniform sampler2D _MetallicGlossMap;
	uniform float3    _GlossColor;
	uniform float     _Specular;
	uniform float     _Metallic;
	uniform float     _GlossMapScale;
	uniform sampler2D _MatCap;
	uniform float3    _MatCapColor;
	uniform bool      _MatCapMaskEnable;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_MatCapMask);
	uniform float     _MatCapStrength;
	uniform bool      _ToonGlossEnable;
	uniform uint      _ToonGloss;
	uniform bool      _SpecularTexColor;
	uniform bool      _MetallicTexColor;
	uniform bool      _MatCapTexColor;
	uniform bool      _SpecularSH;
	uniform float     _SpecularMask;
	uniform uint      _ReflectLit;
	uniform uint      _MatCapLit;
	uniform bool      _IgnoreTexAlphaR;

//----Rim Lighting
	uniform bool      _RimLitEnable;
	UNITY_DECLARE_TEX2D_NOSAMPLER(_RimLitMask);
	uniform float     _RimLit;
	uniform float     _RimLitGradient;
	uniform float4    _RimLitColor;
	uniform bool      _RimLitLighthing;
	uniform bool      _RimLitTexColor;
	uniform uint      _RimLitMode;
	uniform bool      _IgnoreTexAlphaRL;

//----Other
	uniform float     _DirectionalLight;
	uniform float     _PointLight;
	uniform float     _SHLight;
	uniform bool      _LightLimitter;
	uniform float     _MinimumLight;
	uniform int       _BlendOperation;

	uniform bool      _EnableGammaFix;
	uniform float     _GammaR;
	uniform float     _GammaG;
	uniform float     _GammaB;

	uniform bool      _EnableBlightFix;
	uniform float     _BlightOutput;
	uniform float     _BlightOffset;

	uniform bool      _LimitterEnable;
	uniform float     _LimitterMax;


//-------------------------------------頂点シェーダ入力構造体

struct VIN {
	float4 vertex  : POSITION;
	float2 uv      : TEXCOORD;
	float3 normal  : NORMAL;
	float4 tangent : TANGENT;
	float3 color   : COLOR;
};


//-------------------------------------頂点シェーダ出力構造体

struct VOUT {

	float4 pos       : SV_POSITION;
	float2 uv        : TEXCOORD0;
	float4 uvanm     : TEXCOORD1;
	float4 decal     : TEXCOORD2;
	float4 decal2    : TEXCOORD3;
	float4 decanm    : TEXCOORD4;
	float3 normal    : NORMAL;
	float3 color     : COLOR0;
	float4 tangent   : TANGENT;
	float3 ldir      : LIGHTDIR0;
	float3 view      : TEXCOORD5;
	float4 toon      : TEXCOORD6;
	float3 tanW      : TEXCOORD7;
	float3 tanB      : TEXCOORD8;
	float3 matcapv   : TEXCOORD9;
	float3 matcaph   : TEXCOORD10;
	float4 euv       : TEXCOORD11;
	float3 eprm      : TEXCOORD12;
	float4 peuv      : TEXCOORD13;
	float2 pduv      : TEXCOORD14;
	float3 peprm     : TEXCOORD15;
	float3 pview     : TEXCOORD16;
	float4 worldpos  : TEXCOORD17;
	float4 objpos 	 : TEXCOORD18;
	float4 screenpos : TEXCOORD19;
	float  alpha     : TEXCOORD20;

	#ifdef PASS_FB
		float3 shdir   : LIGHTDIR1;
		float3 shmax   : COLOR1;
		float3 shmin   : COLOR2;
		float4 vldirX  : LIGHTDIR2;
		float4 vldirY  : LIGHTDIR3;
		float4 vldirZ  : LIGHTDIR4;
		float4 vlcorr  : TEXCOORD21;
		float4 vlatn   : TEXCOORD22;
	#endif

	UNITY_FOG_COORDS(23)
	#ifdef PASS_FA
		LIGHTING_COORDS(24 , 25)
	#endif

};


//-------------------------------------頂点シェーダ

	#include "SunaoShader_Vert.cginc"


//-------------------------------------フラグメントシェーダ

	#include "SunaoShader_Frag.cginc"
