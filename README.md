<h1>Expense Tracker App</h1>

<i> An exercise from [DesignCode](https://designcode.io). </i>

<h2>About</h2>

The main screen, "Overview", features a chart to track the current month’s spending, where the total amount of spending for each day can be easily displayed just by dragging over the chart line. <br>Under the chart, there's a list of the most recent transactions. A "See All" button/link will allow the user to see the whole list of stored transactions in the "Transactions" screen, where the entries are grouped by month. <br>Mind that a negative number means it's a debit, while a positive one means it's a credit. On the left, we can see the icon associated to the transaction category. 


<img width="1275" alt="Screenshot 2023-02-19 at 13 00 26" src="https://github.com/gperretta/expense-tracker-ios/assets/113616815/b858bf63-ff57-411f-ba02-05d38dd37af1">


<h2>Technologies</h2>

This project was developed in Xcode, coded in Swift and using SwiftUI framework for the user interface, combining both native components and custom elements.<br>
For the charts, it was used an additional Swift package from [AppPear](https://github.com/AppPear/ChartView). The transaction category icons are loaded from a third party library, "SwiftUIFontIcon" and mapped through each category. <br><br>
The app also features a light and a dark theme using a custom color palette, which is adaptable, depending on the phone system theme.
<br><br>Furthermore, the whole app is data focused, calculations are performed and various logics to resolve the right data are applied. 

<h2>Project goal</h2>

The Expense Tracker app development was a practical exercise to expand my knowledge about Swift and back-end development, using <i>property wrapper</i>(s) such as @StateObject and @EnvironmentObject to track and store the state through the app, as a reminder that all the views are simply functions of their state. <br>I've been able to practice the use of protocols (e.g. Hashable) and extensions (e.g. to extend the DateFormatter and the String type to better parse date and specify its format).<br>In the end, I've implemented the front-end side of the app, as I'm always curious about discovering something new, starting from SwiftUI native components and adding customisations.
