/*
* Written by: Evan Colwell
* Date: Spring 2018
* Description: This is a grade calculator that I wrote my freshman year in college
* I am using this as a error-correction challenge for the hacktoberfest 2020
* 
* This code is not well writen, this was before I knew how to write java well
*
* There are 10 errors in this program, try to find them all,
* Good luck,
* and have fun
*/

//Imports
import javautil.Scanner;


public class GradeCalc
{
   public static double GPACalc(double A, double B, double C, double D, double E)
   {
      //Global variables
      double GPA1
      double GPA2;
      double GPA3;
      double GPA4;
      double GPa5;
      
      if(A<0)//Calculation for grade 1
      {
         A=0;
         GPA1=0.0;
      }
      else
      {
         if(A>=90)
         {
            GPA1=4.0;
         }
         else if(A>=80 && A<=89)
         {
            GPA1=3.0;
         }
         else if(A>=70 && A<=79)
         {
            GPA1=2.0;
         }
         elif(A>=65 && A<=69)
         {
            GPA1=1.0;
         }
         else
         {
            GPA1=0.0;
         }
      }
      if(B<0)//grade 2
      {
         B=0;
         GPA2=0.0;
      
      else
      {
         if(B>=90)
         {
            GPA2=4.0;
         }
         else if(B>=80 && B<=89)
         {
            GPA2=3.0;
         }
         else if(B>=70 && B<=79)
         {
            GPA2=2.0;
         }
         else if(B>=65 & B<=69)
         {
            GPA2=1.0;
         }
         else
         {
            GPA2=0.0;
         }
      }
      if(C<0)//grade 3
      {
         C=0;
         GPA3=0.0;
      }
      else
      {
         if(C>=90)
         {
            GPA3=4.0;
         }
         else if(C>=80 && C<=89)
         {
            GPA3=3.0;
         }
         else if(C>=70 && C<=79)
         {
            GPA3=2.0;
         }
         else if(C>=65 && C<=69)
         {
            GPA3=1.0;
         }
         else
         {
            GPA3=0.0;
         }
      }
     if(D<0)//grade 4
      {
         D=0;
         GPA4=0.0;
      }
      else
      {
         if(D>=90)
         {
            GPA4=4.0;
         }
         else if(D>=80 && D<=89)
         {
            GPA4=3.0;
         }
         else if(D>=70 && D<=79)
         {
            GPA4=2.0;
         }
         else if(D>=65 && D<=69)
         {
            GPA4=1.0;
         }
         else
         {
            GPA4=0.0;
         }
      }
      if(E<0)//grade 5
      {
         E=0;
         GPA5=0.0;
      }
      else
      {
         if(E>=90)
         {
            GPA5=4.0;
         }
         else if(E>=80 && E<=89)
         {
            GPA5=3.0;
         }
         else if(E>=70 && E<=79)
         {
            GPA5=2.0;
         }
         else if(E>=65 && E<=69)
         {
            GPA5=1.0;
         }
         else
         {
            GPA5=0.0;
         }
      }
      dbl TotalGPA=(GPA1+GPA2+GPA3+GPA4+GPA5)/(double)5;
      return TotalGPA;
   }
   public static void main(String[]args)
   {
      Scanner sc=new Scanner(System.in);
      
      system.out.print("Enter 5 grades between 0-100: ");
      
      int Grade1=sc.nextInt();
      int Grade2=sc.nextInt();
      int Grade3=sc.nextInt();
      int Grade4=sc.nextInt();
      int Grade5=sc.nextInt();
      
      double FinalGPA=GPACalc(Grade1,Grade2,Grade3,Grade4,Grade5);
      System.out.println("The average GPA is: "+FinalGPA);
   }

      
