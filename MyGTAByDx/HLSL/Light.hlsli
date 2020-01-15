#include"LightHelper.hlsli"


cbuffer VSConstantBuffer : register(b0)
{
	matrix g_World;
	matrix g_View;
	matrix g_Proj;
	matrix g_WorldInvTranspose;

}

cbuffer PSConstantBuffer : register(b1)
{
	DirectionalLight g_DirLight;
	Material g_Material;
	float3 g_EyePos;
	float g_Pad;
	


}

struct VertexIn
{
	float3 PosL : POSITION;
	float3 Normal : NORMAL;
	float4 Color : COLOR;
};

struct VertexOut
{
	float4 PosH : SV_POSITION;
	float3 PosW : POSITION; // 在世界中的位置
	float3 NormalW : NORMAL; // 法向量在世界中的方向
	float4 Color : COLOR;
};