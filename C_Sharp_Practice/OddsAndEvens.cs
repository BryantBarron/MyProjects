/* off of code Wars
 * given a int array check to see
 * if the sum fo the array is odd or even 
 * and return 
 */

using System;
using System.Linq;

namespace LearnIt
{
    class Kata
    {
        public string OddOrEven(int[] array){
            int sum = array.Sum();
            string even = "even";
            string odd = "odd";
            if (sum % 2 == 0)
            {
                return even;
            }
            else
            {
                return odd;
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var instance = new Kata();
            
            var array = new int[] { 2, 3, 4 };
            var array2 = new int[] { 2, 4, 6 };

            Console.WriteLine(instance.OddOrEven(array));
            Console.WriteLine(instance.OddOrEven(array2));

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
