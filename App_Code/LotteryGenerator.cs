using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Lottery
/// </summary>
public class LotteryGenerator
{
    public List<int> randomNumbers {  get;  set; }

    public LotteryGenerator()
	{
        randomNumbers = new List<int>();
	}

    public void GenerateNumbers() { 
        Random RandomClass = new Random();
        for (int i = 0; i < 6; i++) { 
            int num = RandomClass.Next(1,50);
            randomNumbers.Add(num);
        }
    }

    public void Sort() {
        randomNumbers.Sort();
    }
}