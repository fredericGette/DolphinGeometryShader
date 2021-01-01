/*
[configuration]

[OptionRangeFloat]
GUIName = Right delta
OptionName = RIGHT_DELTA
MinValue = 1.0
MaxValue = 10.0
StepAmount = 0.1
DefaultValue = 2.0

[/configuration]
*/

void main()
{
	float2 pos = GetCoordinates();

	float delta = GetOption(RIGHT_DELTA);
	float2 scale = float2(1.0f, delta/(delta-pos.x));
	
	pos = pos * scale;
	
	float4 c0;
	if (pos.y < 0.0f || pos.y > 1.0f || pos.x < 0.0f || pos.x > 1.0f )
	{
		c0 = float4(0.0f, 0.0f, 0.0f, 0.0f);
	}
	else
	{
		c0 = SampleLocation(pos);
	}
			

	SetOutput(c0);
}
