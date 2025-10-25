import 'package:flutter/material.dart';

void main() {
  runApp(const CrystalPowerApp());
}

class CrystalPowerApp extends StatelessWidget {
  const CrystalPowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crystal Power Investments',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          primary: const Color(0xFF1A237E),
          secondary: const Color(0xFFFFD700),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A237E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const PortfolioOverviewScreen(),
    const PropertiesListScreen(),
    const PaymentsScreen(),
    const InvestorsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Crystal Power Investments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '"We only win, When you do"',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_work),
            label: 'Properties',
          ),
          NavigationDestination(
            icon: Icon(Icons.payments),
            label: 'Payments',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Investors',
          ),
        ],
      ),
    );
  }
}

class PortfolioOverviewScreen extends StatelessWidget {
  const PortfolioOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildMetricCard(
          'Total Portfolio Value',
          '30,500,000 EGP',
          Icons.account_balance,
          Colors.green,
          '+8.2% YTD',
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildSmallMetricCard(
                'Properties',
                '6',
                Icons.home_work,
                Colors.blue,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSmallMetricCard(
                'Investors',
                '3',
                Icons.people,
                Colors.purple,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildSmallMetricCard(
                'Overall ROI',
                '136.43%',
                Icons.trending_up,
                Colors.green,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSmallMetricCard(
                'Collection Rate',
                '66.67%',
                Icons.check_circle,
                Colors.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Recent Activity',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildActivityItem(
          'Payment Received',
          'PROP001 - Monthly Rent',
          '52,000 EGP',
          Colors.green,
        ),
        _buildActivityItem(
          'Payment Overdue',
          'PROP003 - 35 days late',
          '47,250 EGP',
          Colors.red,
        ),
        _buildActivityItem(
          'Property Updated',
          'PROP005 - Market value increased',
          '+3.5%',
          Colors.blue,
        ),
      ],
    );
  }

  Widget _buildMetricCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallMetricCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(
    String title,
    String subtitle,
    String value,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(Icons.circle, color: color, size: 12),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}

class PropertiesListScreen extends StatelessWidget {
  const PropertiesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final properties = _getSampleProperties();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: properties.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Properties Portfolio',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Property'),
                ),
              ],
            ),
          );
        }

        final property = properties[index - 1];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        property['id']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                    ),
                    _buildStatusChip(property['status']!),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  property['address']!,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  property['type']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPropertyStat(
                      'Purchase',
                      property['purchase']!,
                      Icons.attach_money,
                    ),
                    _buildPropertyStat(
                      'Current',
                      property['current']!,
                      Icons.trending_up,
                    ),
                    _buildPropertyStat(
                      'ROI',
                      property['roi']!,
                      Icons.percent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'Active':
        color = Colors.green;
        break;
      case 'Pending':
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPropertyStat(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Map<String, String>> _getSampleProperties() {
    return [
      {
        'id': 'PROP001',
        'address': 'Villa 123, Lakes District, New Cairo',
        'type': 'Single Family Villa',
        'status': 'Not Listed',
        'purchase': '4.8M',
        'current': '5.2M',
        'roi': '8.33%',
      },
      {
        'id': 'PROP002',
        'address': 'Apartment 45, Tower B, Sheikh Zayed',
        'type': 'Multi-Family Apartment',
        'status': 'Active',
        'purchase': '2.8M',
        'current': '3.1M',
        'roi': '10.71%',
      },
      {
        'id': 'PROP003',
        'address': 'Commercial Unit 7, Mall Complex, Nasr City',
        'type': 'Commercial Office',
        'status': 'Pending',
        'purchase': '5.5M',
        'current': '6.2M',
        'roi': '12.73%',
      },
    ];
  }
}

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final payments = _getSamplePayments();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: payments.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment Tracking',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildPaymentSummaryCard(
                        'Received',
                        '8',
                        Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildPaymentSummaryCard(
                        'Pending',
                        '1',
                        Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildPaymentSummaryCard(
                        'Overdue',
                        '3',
                        Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        }

        final payment = payments[index - 1];
        return _buildPaymentCard(payment);
      },
    );
  }

  Widget _buildPaymentSummaryCard(String label, String count, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              count,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard(Map<String, dynamic> payment) {
    Color statusColor;
    switch (payment['status']) {
      case 'Received':
        statusColor = Colors.green;
        break;
      case 'Overdue':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.orange;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  payment['id'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    payment['status'],
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${payment['property']} - ${payment['investor']}',
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              payment['type'],
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Text(
                      payment['amount'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (payment['daysLate'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Days Late',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Text(
                        payment['daysLate'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getSamplePayments() {
    return [
      {
        'id': 'PAY001',
        'property': 'PROP001',
        'investor': 'Eng. Mostafa Al-Qadi',
        'type': 'Quarterly Return',
        'amount': '52,000 EGP',
        'status': 'Received',
        'daysLate': null,
      },
      {
        'id': 'PAY003',
        'property': 'PROP003',
        'investor': 'Abdelmohsen Group',
        'type': 'Monthly Rent',
        'amount': '47,250 EGP',
        'status': 'Overdue',
        'daysLate': '35 days',
      },
      {
        'id': 'PAY005',
        'property': 'PROP005',
        'investor': 'Mohamed Maisara',
        'type': 'Quarterly Return',
        'amount': '53,812.50 EGP',
        'status': 'Overdue',
        'daysLate': '45 days',
      },
    ];
  }
}

class InvestorsScreen extends StatelessWidget {
  const InvestorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final investors = _getSampleInvestors();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: investors.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Investor Registry',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }

        final investor = investors[index - 1];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: const Color(0xFF1A237E),
                      child: Text(
                        investor['initials']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            investor['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            investor['strategy']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildPerformanceIndicator(investor['roi']!),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInvestorStat(
                      'Properties',
                      investor['properties']!,
                      Icons.home_work,
                    ),
                    _buildInvestorStat(
                      'Investment',
                      investor['investment']!,
                      Icons.account_balance_wallet,
                    ),
                    _buildInvestorStat(
                      'Portfolio Value',
                      investor['portfolioValue']!,
                      Icons.trending_up,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPerformanceIndicator(String roi) {
    final roiValue = double.parse(roi.replaceAll('%', ''));
    Color color;
    String rating;

    if (roiValue > 100) {
      color = Colors.green;
      rating = '⭐⭐⭐⭐⭐';
    } else if (roiValue > 50) {
      color = Colors.lightGreen;
      rating = '⭐⭐⭐⭐';
    } else {
      color = Colors.orange;
      rating = '⭐⭐⭐';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          roi,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          rating,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildInvestorStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Map<String, String>> _getSampleInvestors() {
    return [
      {
        'initials': 'MA',
        'name': 'Eng. Mostafa Al-Qadi',
        'strategy': 'Long-term Appreciation',
        'properties': '2',
        'investment': '3.7M',
        'portfolioValue': '7.6M',
        'roi': '105.41%',
      },
      {
        'initials': 'MM',
        'name': 'Mohamed Maisara',
        'strategy': 'Mixed Income & Growth',
        'properties': '2',
        'investment': '4.6M',
        'portfolioValue': '7.2M',
        'roi': '56.52%',
      },
      {
        'initials': 'AG',
        'name': 'Abdelmohsen Investment Group',
        'strategy': 'Commercial & Land Development',
        'properties': '2',
        'investment': '4.7M',
        'portfolioValue': '9.7M',
        'roi': '106.38%',
      },
    ];
  }
}
