import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Set up the data based on your actual measurements
data = {
    'Test': ['Workspace Refresh', 'Table Upsert (5MB)', 'Table Upsert (10GB)'],
    'OLD_Total_Time': [342.2, 17.4, 155.4],
    'NEW_Total_Time': [18.1, 0.7, 6.1],
    'OLD_Network': [13.5, 13.5, 16.5],  # GB transferred (from your data)
    'NEW_Network': [4.5, 0.005, 3.0],  # GB transferred (5MB = 0.005GB)
    'Time_Improvement': [94.71, 95.98, 96.07],  # % (from your data)
}

# Calculate network transfer reduction properly based on your actual data
network_reduction = []
for i in range(len(data['OLD_Network'])):
    old_net = data['OLD_Network'][i]
    new_net = data['NEW_Network'][i]
    reduction = ((old_net - new_net) / old_net) * 100
    network_reduction.append(reduction)

data['Network_Improvement'] = network_reduction

df = pd.DataFrame(data)

# Create figure with subplots
fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 12))
fig.suptitle('Performance Comparison: OLD vs NEW Approach\n(103 datasets, 20.5GB total)', fontsize=16, fontweight='bold')

# 1. Total Time Comparison
x = np.arange(len(df['Test']))
width = 0.35

bars1 = ax1.bar(x - width/2, df['OLD_Total_Time'], width, label='OLD', color='#e74c3c', alpha=0.8)
bars2 = ax1.bar(x + width/2, df['NEW_Total_Time'], width, label='NEW', color='#27ae60', alpha=0.8)

ax1.set_xlabel('Test Scenarios')
ax1.set_ylabel('Total Time (seconds)')
ax1.set_title('Total Time Comparison')
ax1.set_xticks(x)
ax1.set_xticklabels(df['Test'], rotation=15, ha='right')
ax1.legend()
ax1.grid(axis='y', alpha=0.3)

# Add value labels on bars
for bar in bars1:
    height = bar.get_height()
    ax1.text(bar.get_x() + bar.get_width()/2., height + max(df['OLD_Total_Time'].max(), df['NEW_Total_Time'].max()) * 0.01,
             f'{height:.1f}s', ha='center', va='bottom', fontsize=9)
for bar in bars2:
    height = bar.get_height()
    ax1.text(bar.get_x() + bar.get_width()/2., height + max(df['OLD_Total_Time'].max(), df['NEW_Total_Time'].max()) * 0.01,
             f'{height:.1f}s', ha='center', va='bottom', fontsize=9)

# 2. Network Transfer Comparison
bars3 = ax2.bar(x - width/2, df['OLD_Network'], width, label='OLD', color='#e74c3c', alpha=0.8)
bars4 = ax2.bar(x + width/2, df['NEW_Network'], width, label='NEW', color='#27ae60', alpha=0.8)

ax2.set_xlabel('Test Scenarios')
ax2.set_ylabel('Network Transfer (GB)')
ax2.set_title('Network Transfer Comparison')
ax2.set_xticks(x)
ax2.set_xticklabels(df['Test'], rotation=15, ha='right')
ax2.legend()
ax2.grid(axis='y', alpha=0.3)

# Add value labels on bars
for bar in bars3:
    height = bar.get_height()
    ax2.text(bar.get_x() + bar.get_width()/2., height + max(df['OLD_Network'].max(), df['NEW_Network'].max()) * 0.01,
             f'{height:.1f}GB', ha='center', va='bottom', fontsize=9)
for bar in bars4:
    height = bar.get_height()
    ax2.text(bar.get_x() + bar.get_width()/2., height + max(df['OLD_Network'].max(), df['NEW_Network'].max()) * 0.01,
             f'{height:.2f}GB' if height < 1 else f'{height:.1f}GB', 
             ha='center', va='bottom', fontsize=9)

# 3. Time Improvement Percentage
bars5 = ax3.bar(x, df['Time_Improvement'], width=0.6, color='#2ecc71', alpha=0.8)
ax3.set_xlabel('Test Scenarios')
ax3.set_ylabel('Time Improvement (%)')
ax3.set_title('Time Improvement (NEW vs OLD)')
ax3.set_xticks(x)
ax3.set_xticklabels(df['Test'], rotation=15, ha='right')
ax3.grid(axis='y', alpha=0.3)
ax3.set_ylim(90, 100)

# Add value labels
for bar in bars5:
    height = bar.get_height()
    ax3.text(bar.get_x() + bar.get_width()/2., height + 0.1,
             f'{height:.1f}%', ha='center', va='bottom', fontsize=9, fontweight='bold')

# 4. Network Transfer Improvement Percentage - FIXED Y-AXIS TO 130%
bars6 = ax4.bar(x, df['Network_Improvement'], width=0.6, color='#3498db', alpha=0.8)
ax4.set_xlabel('Test Scenarios')
ax4.set_ylabel('Network Transfer Reduction (%)')
ax4.set_title('Network Transfer Reduction (NEW vs OLD)')
ax4.set_xticks(x)
ax4.set_xticklabels(df['Test'], rotation=15, ha='right')
ax4.grid(axis='y', alpha=0.3)
ax4.set_ylim(60, 130)  # FIXED: Extended y-axis to 130% for better visibility

# Add value labels - FIXED TO SHOW ACTUAL VALUES
for bar in bars6:
    height = bar.get_height()
    ax4.text(bar.get_x() + bar.get_width()/2., height + 2,  # Increased offset for better spacing
             f'{height:.2f}%', ha='center', va='bottom', fontsize=9, fontweight='bold')  # Show 2 decimal places

# Ensure all subplots have the same x-axis limits and alignment
for ax in [ax1, ax2, ax3, ax4]:
    ax.set_xlim(-0.5, len(df['Test']) - 0.5)

# Adjust layout with better spacing
plt.tight_layout()
plt.subplots_adjust(hspace=0.3, wspace=0.3)

# Save the plot
plt.savefig('performance_comparison_large_dataset_corrected.png', dpi=300, bbox_inches='tight')
plt.show()

# Print summary statistics
print("\n" + "="*70)
print("PERFORMANCE SUMMARY - LARGE DATASET (20.5GB)")
print("="*70)
print(f"{'Test':<25} {'Time Improvement':<15} {'Network Reduction':<15}")
print("-"*70)

for i, test in enumerate(df['Test']):
    print(f"{test:<25} {df['Time_Improvement'][i]:>13.1f}% {df['Network_Improvement'][i]:>13.2f}%")

print(f"\nAverage Time Improvement: {df['Time_Improvement'].mean():.1f}%")
print(f"Average Network Reduction: {df['Network_Improvement'].mean():.2f}%")

# Create a combined comparison chart
fig2, ax = plt.subplots(1, 1, figsize=(12, 8))

# Create a grouped bar chart showing both time and network improvements
x = np.arange(len(df['Test']))
width = 0.35

bars_time = ax.bar(x - width/2, df['Time_Improvement'], width, label='Time Improvement (%)', color='#2ecc71', alpha=0.8)
bars_network = ax.bar(x + width/2, df['Network_Improvement'], width, label='Network Reduction (%)', color='#3498db', alpha=0.8)

ax.set_xlabel('Test Scenarios')
ax.set_ylabel('Improvement Percentage (%)')
ax.set_title('Combined Performance Improvements - Large Dataset (20.5GB)\nNEW vs OLD Approach', fontsize=14, fontweight='bold')
ax.set_xticks(x)
ax.set_xticklabels(df['Test'], rotation=15, ha='right')
ax.legend()
ax.grid(axis='y', alpha=0.3)
ax.set_ylim(60, 130)  # FIXED: Extended y-axis to 130% for better visibility

# Add value labels - FIXED TO SHOW ACTUAL VALUES
for bars in [bars_time, bars_network]:
    for bar in bars:
        height = bar.get_height()
        ax.text(bar.get_x() + bar.get_width()/2., height + 2,  # Increased offset for better spacing
                f'{height:.2f}%', ha='center', va='bottom', fontsize=10, fontweight='bold')  # Show 2 decimal places

plt.tight_layout()
plt.savefig('combined_improvements_large_dataset_corrected.png', dpi=300, bbox_inches='tight')
plt.show()