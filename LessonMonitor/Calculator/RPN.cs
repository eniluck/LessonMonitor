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
        private readonly string _delimeters = " =";
        private readonly string _operators = "+-*()";

        // Вычисление входной строки
        public decimal Calculate(string input)
        {
            // Преобразовываем строку в постфиксную запись
            Stack<decimal> RPN = GetRPNfromString(input);

            //Решаем полученное выражение
            decimal result = Counting(output);
            return result;
        }


        //Метод возвращает true, если проверяемый символ - разделитель ("пробел" или "равно")
        private bool IsDelimeter(char c)
        {
            if ((_delimeters.IndexOf(c) != -1))
                return true;
            return false;
        }

        //Метод возвращает true, если проверяемый символ - оператор
        private bool IsOperator(char с)
        {
            if ((_operators.IndexOf(с) != -1))
                return true;
            return false;
        }

        //Метод возвращает приоритет оператора
        private byte GetPriority(char s)
        {
            switch (s)
            {
                case '(': return 0;
                case ')': return 1;
                case '+': return 2;
                case '-': return 3;
                case '*': return 4;
                default: return 5;
            }
        }

        private RPNdto GetRPNfromString(string input)
        {
            //Stack<string> result = new Stack<string>();
            RPNdto result = new RPNdto()
            {
                numbers = new Stack<string>(),
                operations = new Stack<char>()
            };

            Stack<char> operStack = new Stack<char>();      //Стек для хранения операторов

            for (int i = 0; i < input.Length; i++)
            {
                //Разделители пропускаем
                if (IsDelimeter(input[i]))
                    continue; 

                //Если символ - цифра, то считываем все число
                if (Char.IsDigit(input[i])) 
                {
                    string tempNumber = "";

                    //Читаем до разделителя или оператора, что бы получить число
                    while (!IsDelimeter(input[i]) && !IsOperator(input[i]))
                    {
                        tempNumber += input[i]; //Добавляем каждую цифру числа к нашей строке
                        i++; //Переходим к следующему символу

                        if (i == input.Length) break; //Если символ - последний, то выходим из цикла
                    }

                    result.numbers.Push(tempNumber);
                    i--; //Возвращаемся на один символ назад, к символу перед разделителем
                }

                //Если символ - оператор
                if (IsOperator(input[i])) //Если оператор
                {
                    if (input[i] == '(') //Если символ - открывающая скобка
                        operStack.Push(input[i]); //Записываем её в стек
                    else if (input[i] == ')') //Если символ - закрывающая скобка
                    {
                        //Выписываем все операторы до открывающей скобки в строку
                        char s = operStack.Pop();

                        while (s != '(')
                        {
                            result.operations.Push(s);
                            s = operStack.Pop();
                        }
                    }
                    else //Если любой другой оператор
                    {
                        if (operStack.Count > 0) //Если в стеке есть элементы
                            if (GetPriority(input[i]) <= GetPriority(operStack.Peek())) //И если приоритет нашего оператора меньше или равен приоритету оператора на вершине стека
                                result.operations.Push(operStack.Pop()); 

                        operStack.Push(char.Parse(input[i].ToString())); //Если стек пуст, или же приоритет оператора выше - добавляем операторов на вершину стека
                    }
                }
            }

            //Когда прошли по всем символам, выкидываем из стека все оставшиеся там операторы в строку
            while (operStack.Count > 0)
                result.operations.Push(operStack.Pop());

            return result;
        }

        private decimal Compute(RPNdto input)
        {
            decimal result = 0; //Результат
            Stack<decimal> temp = new Stack<decimal>(); //Dhtvtyysq стек для решения

            for (int i = 0; i < input.Length; i++) //Для каждого символа в строке
            {
                //Если символ - цифра, то читаем все число и записываем на вершину стека
                if (Char.IsDigit(input[i]))
                {
                    string a = string.Empty;

                    while (!IsDelimeter(input[i]) && !IsOperator(input[i])) //Пока не разделитель
                    {
                        a += input[i]; //Добавляем
                        i++;
                        if (i == input.Length) break;
                    }
                    temp.Push(int.Parse(a)); //Записываем в стек
                    i--;
                }
                else if (IsOperator(input[i])) //Если символ - оператор
                {
                    //Берем два последних значения из стека
                    int a = temp.Pop();
                    int b = temp.Pop();

                    switch (input[i]) //И производим над ними действие, согласно оператору
                    {
                        case '+': result = b + a; break;
                        case '-': result = b - a; break;
                        case '*': result = b * a; break;
                    }
                    temp.Push(result); //Результат вычисления записываем обратно в стек
                }
            }
            return temp.Peek(); //Забираем результат всех вычислений из стека и возвращаем его
        }
    }

    public class RPNdto
    {
        public Stack<string> numbers { get; set; }
        public Stack<char> operations { get; set; }
    }
}
