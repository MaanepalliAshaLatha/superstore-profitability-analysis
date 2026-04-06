🏪 <b>Global Superstore Profitability Analysis</b><br><br>

<b>Tools:</b> MySQL, Excel<br>
<b>Dataset:</b> 51,290 orders across 147 countries<br><br>

<b>🔍 Problem</b><br>
Despite strong revenue, the business was experiencing consistent profit losses without clear visibility into the root cause.<br><br>

<b>⚙️ Approach</b><br>
• Analyzed 51,290 orders using SQL (CTEs, CASE WHEN, joins)<br>
• Segmented transactions by discount levels and product sub-categories<br>
• Built Excel dashboard to validate and visualize patterns<br><br>

<b>📊 Key Insights</b><br>
• <b>84.83% of total losses</b> were driven by discounts ≥40%<br>
• <b>Tables</b> generated the highest losses (~₹1.11L) under heavy discounting<br>
• <b>Machines</b> contributed ~₹72K in losses<br>
• Losses were <b>highly concentrated</b>, not distributed across all products<br><br>

<b>💡 Business Impact</b><br>
• Recommended <b>30% discount cap</b> on loss-making categories<br>
• Estimated <b>₹80–90K margin recovery</b> without reducing order volume<br>
• Identified specific sub-categories for pricing intervention<br><br>

<b>📈 Dashboard Highlights</b><br>
• Consumer segment contributes <b>51% of total orders</b><br>
• Technology is the top revenue category (~$827K)<br>
• Regional performance differences identified for better decision-making<br><br>

<b>📁 Repository Structure</b><br>
• Data_Analysis.docx<br>
• Global_Superstore2.csv<br>
• queries.sql<br>
• dashboard.png<br>
• README.md → Documentation<br>
