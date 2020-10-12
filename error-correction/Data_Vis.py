'''
Author: Evan Colwell
Date: 10/11/2020
Description: Data_Vis.py is a simple data visualization program
             for the error correction challenge for CSA Hacktoberfest 2020
'''

# There are 8 errors in this code. One of the errors is a logical error not a code breaking one. The rest are syntax.
# Good luck and have fun!

#Imports
import matplotlib.pyplot as plt
numpy as np
import random
import seaborn as sns

#Generate data using a six sided dice rolled 1000 times
rolls = [random.randrange(1,7) for i in range(1000)]
#Seperates the data into their values and frequencies
values, frequencies = np.unique(rolls, return_counts=true)

---Visualization---

#Title of the bar chart
title = 'Rolling a six-sided die {len(rolls):,} times'

sns.set_style('whitegrid') #For style of the bar chart
axes = sns.barplot(x = values, y = frequencies) #Plug data into the bar chart
axes.set_title(title) #Sets the title
axesset(xlabel = 'Die value', ylabel = 'Frequency') #Sets the name of the x axis and y axis.
axes.set_ylim(top = max(frequencies) * 1.20) #Adds some white space between the top of the bars and the top of the chart. (120%)

for bar, frequency in zip(axes.patches, frequencies) # Do this for each bar in the graph
    text_x = bar.get_x()+bar.get_width()/2.0 #Sets the bottom x text and fits it to the bar
    text_y = bar.get_height(); #Sets the side y text to the height of the bars
    text = f'{frequency:,}\n{frequency/len(rolls):.3%}' #Sets the bar text
    axes.text(text_x, text_y, text, fontsize = 11, ha = 'center', va = 'bottom') #Makes the bars

plt.show(