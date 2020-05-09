package com.smitlimbani.smitcalc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Stack;

public class CalculateExpr extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String expr = request.getParameter("exprStr");
        int result = 0;
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Result Page</title></head><body>");
        out.println("<h2>");
//        out.println("this works");

        try {
            result = evaluate(expr);
            out.println(expr+" = "+result);
        }
        catch(Exception e) {
            out.println("Invalid Expression : {{ " + expr + " }}");
        }
        out.println("</h2>");
        out.println("</body></html>");
    }
    public static int evaluate(String expression)
    {
        char[] tokens = expression.toCharArray();
        Stack<Integer> values = new Stack<Integer>();
        Stack<Character> ops = new Stack<Character>();

        for (int i = 0; i < tokens.length; i++)
        {
            if (tokens[i] == ' ')
                continue;
            if (tokens[i] >= '0' && tokens[i] <= '9')
            {
                StringBuffer sbuf = new StringBuffer();
                while (i < tokens.length && tokens[i] >= '0' && tokens[i] <= '9')
                    sbuf.append(tokens[i++]);
                values.push(Integer.parseInt(sbuf.toString()));
            }
            else if (tokens[i] == '(')
                ops.push(tokens[i]);
            else if (tokens[i] == ')')
            {
                while (ops.peek() != '(')
                    values.push(applyOp(ops.pop(), values.pop(), values.pop()));
                ops.pop();
            }
            else if (tokens[i] == '+' || tokens[i] == '-' ||
                    tokens[i] == '*' || tokens[i] == '/' || tokens[i]=='^')
            {
                while (!ops.empty() && hasPrecedence(tokens[i], ops.peek()))
                    values.push(applyOp(ops.pop(), values.pop(), values.pop()));

                ops.push(tokens[i]);
            }
        }
        while (!ops.empty())
            values.push(applyOp(ops.pop(), values.pop(), values.pop()));
        return values.pop();
    }

    public static boolean hasPrecedence(char op1, char op2)
    {
        if (op2 == '(' || op2 == ')')
            return false;
        if (op1 == '^')
            return false;
        if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-'))
            return false;
        else
            return true;
    }
    public static int applyOp(char op, int b, int a)
    {
        switch (op)
        {
            case '+':
                return a + b;
            case '-':
                return a - b;
            case '*':
                return a * b;
            case '/':
                if (b == 0)
                    return Integer.MAX_VALUE;
                return a / b;
            case '^':
                return (int)Math.pow(a, b);
        }
        return 0;
    }
}

