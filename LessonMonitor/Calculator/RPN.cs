using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Calculator
{
    // Обратная польская запись Reverse Polish Notation
    public class RPN
    {
        // Вычисление входной строки
        public decimal Calculate(string input)
        {
            // Преобразовываем строку в постфиксную запись
            Stack<decimal> RPN = GetRPNfromString(input);

            //Решаем полученное выражение
            decimal result = Counting(output); 
            return result; 
        }

        private Stack<decimal> GetRPNfromString(string input)
        {
            Stack<decimal> result = new Stack<decimal>();
            Stack<char> operStack = new Stack<char>();      //Стек для хранения операторов


            return null;
        }
    }
}
