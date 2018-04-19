/*
 * Kata to Check twos and threes in a 5 character array
 * return return if 2 As, Bs, Cs, and 3 As, Bs, Cs 
 * in any order but can only have 2 of 1 and 3 of the
 * other.
 * 
 * AABBB passes
 * AAAAA fails
 * ACABA fails 
 * 
 */
using System;
using System.Collections.Generic;
using System.Text;

namespace Kata2
{
    class TwosAndThreesTest
    {
        public static bool CheckThreeAndTwo(string[] array)
        {
            var countA = 0;
            var countB = 0;
            var countC = 0;

            for (int i = 0; i < array.Length; i++)
            {
                if (array[i] == "a")
                {
                    countA++;
                }
                else if (array[i] == "b")
                {
                    countB++;
                }
                else if (array[i] == "c")
                {
                    countC++;
                }
            }

            if((countA ==3 || countB == 3 || countC == 3) && 
                (countA == 2 || countB == 2 || countC == 2))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
    class TwosAndThrees
    {
        static void Main(string[] args)
        {


            string[] array1 = { "a", "b", "a", "b", "a" };
            string[] array2 = { "a", "a", "a", "a", "a" };
            string[] array3 = { "c", "c", "b", "b", "b" };

            bool test = TwosAndThreesTest.CheckThreeAndTwo(array1);
            bool test2 = TwosAndThreesTest.CheckThreeAndTwo(array2);
            bool test3 = TwosAndThreesTest.CheckThreeAndTwo(array3);
            Console.WriteLine(test.ToString());
            Console.WriteLine(test2.ToString());
            Console.WriteLine(test3.ToString());

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
