using System;

namespace Codewars
{
    class Program
    {
        public static int CalculateYears(double principal, double interest, double tax, double desiredPrincipal)
        {
            int years = 0;
            double principalWithInterest = 0;
            double taxableInterest = 0;
            double finalPrincipal = 0;


            while (principal < desiredPrincipal)
            {
                principalWithInterest = (principal * interest) + principal;
               
                taxableInterest = principalWithInterest - principal;
               
                finalPrincipal = principalWithInterest - (taxableInterest * tax);
               
                principal = finalPrincipal;
              
                years++;
            }

            
            return years;
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Pleaase enter your starting principal: ");
            double principal = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Please enter your interest: ");
            double interest = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Please enter your tax in dccimal form: ");
            double tax = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Please enter your goal principal: ");
            double desiredPrincipal = Convert.ToDouble(Console.ReadLine());

            int years = CalculateYears(principal, interest, tax, desiredPrincipal);

            Console.WriteLine(years);
        }
    }
}
