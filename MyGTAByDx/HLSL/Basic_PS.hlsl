#include "Basic.hlsli"

float4 main(VertexPosHWNormalTex pIn) : SV_Target
{
	    // 标准化法向量
	pIn.NormalW = normalize(pIn.NormalW);

    // 顶点指向眼睛的向量
	float3 toEyeW = normalize(g_EyePosW - pIn.PosW);

    // 初始化为0 
	float4 ambient = float4(0.0f, 0.0f, 0.0f, 0.0f);
	float4 diffuse = float4(0.0f, 0.0f, 0.0f, 0.0f);
	float4 spec = float4(0.0f, 0.0f, 0.0f, 0.0f);
	float4 A = float4(0.0f, 0.0f, 0.0f, 0.0f);
	float4 D = float4(0.0f, 0.0f, 0.0f, 0.0f);
	float4 S = float4(0.0f, 0.0f, 0.0f, 0.0f);
	int i;

	ComputeDirectionLight(g_Material, g_DirLight, pIn.NormalW, toEyeW, A, D, S);
	ambient += A;
	diffuse += D;
	spec += S;
    
 
 

	float4 texColor = g_Tex.Sample(g_SamLinear, pIn.Tex);
	float4 litColor = texColor * (ambient + diffuse) + spec;
	litColor.a = texColor.a * g_Material.Diffuse.a;
	
	return litColor;
	
	//return float4(1.0f, 1.0f, 1.0f, 1.0f);
	
	
}