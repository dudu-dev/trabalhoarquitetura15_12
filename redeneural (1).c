#include<stdio.h>
#include<stdlib.h>
#include<locale.h>


int main()
{
    int i;
    float w0 = 0, w1 = 0, erro = 0, taxa_aprendizado = 0.05;
    float termo1_1 = 1, termo1_2 = 1, saida1 = 0, saida_neuronio1 = 0;
    float termo2_1 = 2, termo2_2 = 2, saida2 = 0, saida_neuronio2 = 0;
    float termo3_1 = 3, termo3_2 = 3, saida3 = 0, saida_neuronio3 = 0;
    float termo4_1 = 4, termo4_2 = 4, saida4 = 0, saida_neuronio4 = 0;


    saida1 = (termo1_1 + termo1_2);
    saida2 = (termo2_1 + termo2_2);
    saida3 = (termo3_1 + termo3_2);
    saida4 = (termo4_1 + termo4_2);


    printf("\nDigite o primeiro peso: ");
    scanf("%f",&w0);
    printf("\nDigite o primeiro peso: ");
    scanf("%f",&w1);

    for (i = 0; i <= 11; i++)
    {
        saida_neuronio1 = ((termo1_1 * w0) + (termo1_2 * w1));
        erro = (saida1 - saida_neuronio1);
        w0 = (w0 + ((erro * taxa_aprendizado) * termo1_1));
        w1 = (w1 + ((erro * taxa_aprendizado) * termo1_2));


        saida_neuronio2 = ((termo2_1 * w0) + (termo2_2 * w1));
        erro = (saida2 - saida_neuronio2);
        w0 = (w0 + ((erro * taxa_aprendizado) * termo2_1));
        w1 = (w1 + ((erro * taxa_aprendizado) * termo2_2));


        saida_neuronio3 = ((termo3_1 * w0) + (termo3_2 * w1));
        erro = (saida3 - saida_neuronio3);
        w0 = (w0 + ((erro * taxa_aprendizado) * termo3_1));
        w1 = (w1 + ((erro * taxa_aprendizado) * termo3_2));


        saida_neuronio4 = ((termo4_1 * w0) + (termo4_2 * w1));
        erro = (saida4 - saida_neuronio4);
        w0 = (w0 + ((erro * taxa_aprendizado) * termo4_1));
        w1 = (w1 + ((erro * taxa_aprendizado) * termo4_2));

    }
    
    printf("\nApós a rede ser treinada %d vezes, a relação entre saída esperada e saída do neurônio foi:", i);
    printf("\nEsperada: %2.2f  | Neurônio: %2.2f", saida1, saida_neuronio1);
    printf("\nEsperada: %2.2f  | Neurônio: %2.2f", saida2, saida_neuronio2);
    printf("\nEsperada: %2.2f  | Neurônio: %2.2f", saida3, saida_neuronio3);
    printf("\nEsperada: %2.2f  | Neurônio: %2.2f", saida4, saida_neuronio4);
    
 return 0;
}