package bzu_stu_other;

public class levelUpdate {
	
	public int updateLevel(int integ)
	{
		int level=1;
		if(integ>0&&integ<=15)
		{
			level=1;
		}else if(integ>15&&integ<=45)
		{
			level=2;
		}else if(integ>45&&integ<=80)
		{
			level=3;
		}else if(integ>80&&integ<=125)
		{
			level=4;
		}else if(integ>125&&integ<=180)
		{
			level=5;
		}else if(integ>180&&integ<=250)
		{
			level=6;
		}else if(integ>250&&integ<=320)
		{
			level=7;
		}else if(integ>320&&integ<=400)
		{
			level=8;
		}else if(integ>400&&integ<=500)
		{
			level=9;
		}else if(integ>500&&integ<=630)
		{
			level=10;
		}else if(integ>630&&integ<=760)
		{
			level=11;
		}else if(integ>760&&integ<=900)
		{
			level=12;
		}else if(integ>900&&integ<=1050)
		{
			level=13;
		}else if(integ>1050&&integ<=1210)
		{
			level=14;
		}else if(integ>1210&&integ<=1390)
		{
			level=15;
		}else if(integ>1390&&integ<=1590)
		{
			level=16;
		}else if(integ>1590&&integ<=1810)
		{
			level=17;
		}else if(integ>1810&&integ<=2050)
		{
			level=18;
		}else if(integ>2050&&integ<=2320)
		{
			level=19;
		}else if(integ>2320&&integ<=2600)
		{
			level=20;
		}
		
		
		return level;
	}

}
