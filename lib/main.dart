import 'package:flutter/material.dart';

void main() {
  runApp(const AssetManagementApp());
}

class AssetManagementApp extends StatelessWidget {
  const AssetManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset mangement',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          primary: const Color(0xFF1A237E),
          secondary: const Color(0xFFFFD700),
        ),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const PropertiesScreen(),
    const PaymentsScreen(),
    const InvestorsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
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
            icon: Icon(Icons.payment),
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

// ============================================================================
// DASHBOARD SCREEN
// ============================================================================

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Asset mangement',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Crystal Power Investments',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Tagline
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1A237E),
                    const Color(0xFF1A237E).withValues(alpha: 0.8),
                  ],
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    '"We only win, When you do"',
                    style: TextStyle(
                      color: Color(0xFFFFD700),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Mo\'men Maisara - CEO',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Main Portfolio Metric
            _buildMainMetricCard(
              context,
              'Total Portfolio Value',
              '30,500,000 EGP',
              Icons.account_balance_wallet,
              Colors.green,
              '+8.2% YTD',
            ),

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Key Metrics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Key Metrics Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: _buildSmallMetricCard(
                      'Properties',
                      '6',
                      Icons.home_work,
                      Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: _buildSmallMetricCard(
                      'Overall ROI',
                      '136.43%',
                      Icons.trending_up,
                      Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: _buildSmallMetricCard(
                      'Active Investors',
                      '3',
                      Icons.people,
                      Colors.purple,
                    ),
                  ),
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
            ),

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Recent Activity
            _buildActivityItem(
              'Payment Received',
              'Eng. Mostafa Al-Qadi - 80,000 EGP',
              Icons.payment,
              Colors.green,
              '2 days ago',
            ),
            _buildActivityItem(
              'Payment Overdue',
              'Mohamed Maisara - 50,000 EGP',
              Icons.warning,
              Colors.red,
              '15 days overdue',
            ),
            _buildActivityItem(
              'New Property Listed',
              'Apartment, Maadi - 2.8M EGP',
              Icons.home,
              Colors.blue,
              '1 week ago',
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildMainMetricCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
    String change,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
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
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    change,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
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
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    String time,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 24),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: Text(
        time,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
    );
  }
}

// ============================================================================
// PROPERTIES SCREEN
// ============================================================================

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final properties = [
      {
        'id': 'PROP001',
        'address': 'Villa 123, Lakes District, New Cairo',
        'city': 'New Cairo',
        'type': 'Single Family Villa',
        'status': 'Not Listed',
        'purchase': '4,800,000',
        'current': '5,200,000',
        'roi': '8.33%',
        'investor': 'Eng. Mostafa Al-Qadi',
        'bedrooms': '4',
        'bathrooms': '3',
      },
      {
        'id': 'PROP002',
        'address': 'Apartment 45B, Palm Hills, Sheikh Zayed',
        'city': 'Sheikh Zayed',
        'type': 'Apartment',
        'status': 'Listed',
        'purchase': '2,200,000',
        'current': '2,500,000',
        'roi': '13.64%',
        'investor': 'Eng. Mostafa Al-Qadi',
        'bedrooms': '3',
        'bathrooms': '2',
      },
      {
        'id': 'PROP003',
        'address': 'Villa 78, Narges District, Nasr City',
        'city': 'Nasr City',
        'type': 'Villa',
        'status': 'Not Listed',
        'purchase': '5,500,000',
        'current': '6,300,000',
        'roi': '14.55%',
        'investor': 'Mohamed Maisara',
        'bedrooms': '5',
        'bathrooms': '4',
      },
      {
        'id': 'PROP004',
        'address': 'Townhouse 12, 6th October Gardens',
        'city': '6th October',
        'type': 'Townhouse',
        'status': 'Listed',
        'purchase': '3,200,000',
        'current': '3,500,000',
        'roi': '9.38%',
        'investor': 'Mohamed Maisara',
        'bedrooms': '4',
        'bathrooms': '3',
      },
      {
        'id': 'PROP005',
        'address': 'Apartment 301, Street 9, Maadi',
        'city': 'Maadi',
        'type': 'Apartment',
        'status': 'Listed',
        'purchase': '2,800,000',
        'current': '3,000,000',
        'roi': '7.14%',
        'investor': 'Abdelmohsen Group',
        'bedrooms': '3',
        'bathrooms': '2',
      },
      {
        'id': 'PROP006',
        'address': 'Villa 456, Green District, NAC',
        'city': 'New Administrative Capital',
        'type': 'Villa',
        'status': 'Not Listed',
        'purchase': '12,000,000',
        'current': '12,000,000',
        'roi': '0.00%',
        'investor': 'Abdelmohsen Group',
        'bedrooms': '6',
        'bathrooms': '5',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          final statusColor = property['status'] == 'Listed'
              ? Colors.green
              : Colors.orange;

          return Card(
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF1A237E).withValues(alpha: 0.1),
                child: const Icon(Icons.home, color: Color(0xFF1A237E)),
              ),
              title: Text(
                property['address']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${property['type']} • ${property['city']}'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  property['status']!,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildPropertyDetail('Property ID', property['id']!),
                      _buildPropertyDetail('Investor', property['investor']!),
                      _buildPropertyDetail(
                        'Purchase Price',
                        '${property['purchase']} EGP',
                      ),
                      _buildPropertyDetail(
                        'Current Value',
                        '${property['current']} EGP',
                      ),
                      _buildPropertyDetail('ROI', property['roi']!),
                      _buildPropertyDetail(
                        'Layout',
                        '${property['bedrooms']} Bed • ${property['bathrooms']} Bath',
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                              label: const Text('Edit'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility),
                              label: const Text('View Details'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1A237E),
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPropertyDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// PAYMENTS SCREEN
// ============================================================================

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final payments = [
      {
        'id': 'PAY001',
        'property': 'PROP001',
        'investor': 'Eng. Mostafa Al-Qadi',
        'type': 'Rent',
        'amount': '80,000',
        'expected': '2024-01-15',
        'actual': '2024-01-14',
        'status': 'Received',
        'daysLate': '0',
        'lateFee': '0',
      },
      {
        'id': 'PAY002',
        'property': 'PROP002',
        'investor': 'Eng. Mostafa Al-Qadi',
        'type': 'Rent',
        'amount': '45,000',
        'expected': '2024-01-15',
        'actual': '2024-01-20',
        'status': 'Received',
        'daysLate': '5',
        'lateFee': '0',
      },
      {
        'id': 'PAY003',
        'property': 'PROP003',
        'investor': 'Mohamed Maisara',
        'type': 'Rent',
        'amount': '90,000',
        'expected': '2024-01-15',
        'actual': 'Not Paid',
        'status': 'Overdue',
        'daysLate': '52',
        'lateFee': '4,500',
      },
      {
        'id': 'PAY004',
        'property': 'PROP004',
        'investor': 'Mohamed Maisara',
        'type': 'Rent',
        'amount': '50,000',
        'expected': '2024-01-15',
        'actual': 'Not Paid',
        'status': 'Overdue',
        'daysLate': '52',
        'lateFee': '2,500',
      },
      {
        'id': 'PAY005',
        'property': 'PROP005',
        'investor': 'Abdelmohsen Group',
        'type': 'Rent',
        'amount': '55,000',
        'expected': '2024-01-15',
        'actual': '2024-01-16',
        'status': 'Received',
        'daysLate': '1',
        'lateFee': '0',
      },
      {
        'id': 'PAY006',
        'property': 'PROP001',
        'investor': 'Eng. Mostafa Al-Qadi',
        'type': 'Maintenance',
        'amount': '25,000',
        'expected': '2024-02-01',
        'actual': '2024-02-05',
        'status': 'Received',
        'daysLate': '4',
        'lateFee': '0',
      },
      {
        'id': 'PAY007',
        'property': 'PROP002',
        'investor': 'Eng. Mostafa Al-Qadi',
        'type': 'Rent',
        'amount': '45,000',
        'expected': '2024-02-15',
        'actual': '2024-02-18',
        'status': 'Received',
        'daysLate': '3',
        'lateFee': '0',
      },
      {
        'id': 'PAY008',
        'property': 'PROP003',
        'investor': 'Mohamed Maisara',
        'type': 'Rent',
        'amount': '90,000',
        'expected': '2024-02-15',
        'actual': 'Not Paid',
        'status': 'Overdue',
        'daysLate': '22',
        'lateFee': '0',
      },
      {
        'id': 'PAY009',
        'property': 'PROP004',
        'investor': 'Mohamed Maisara',
        'type': 'Rent',
        'amount': '50,000',
        'expected': '2024-02-15',
        'actual': 'Not Paid',
        'status': 'Pending',
        'daysLate': '22',
        'lateFee': '0',
      },
      {
        'id': 'PAY010',
        'property': 'PROP005',
        'investor': 'Abdelmohsen Group',
        'type': 'Rent',
        'amount': '55,000',
        'expected': '2024-02-15',
        'actual': '2024-02-14',
        'status': 'Received',
        'daysLate': '0',
        'lateFee': '0',
      },
      {
        'id': 'PAY011',
        'property': 'PROP001',
        'investor': 'Eng. Mostafa Al-Qadi',
        'type': 'Rent',
        'amount': '80,000',
        'expected': '2024-03-15',
        'actual': 'Not Paid',
        'status': 'Pending',
        'daysLate': '0',
        'lateFee': '0',
      },
      {
        'id': 'PAY012',
        'property': 'PROP006',
        'investor': 'Abdelmohsen Group',
        'type': 'Maintenance',
        'amount': '150,000',
        'expected': '2024-03-01',
        'actual': 'Not Paid',
        'status': 'Pending',
        'daysLate': '0',
        'lateFee': '0',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: payments.length,
        itemBuilder: (context, index) {
          final payment = payments[index];

          Color statusColor;
          IconData statusIcon;
          switch (payment['status']) {
            case 'Received':
              statusColor = Colors.green;
              statusIcon = Icons.check_circle;
              break;
            case 'Overdue':
              statusColor = Colors.red;
              statusIcon = Icons.error;
              break;
            default:
              statusColor = Colors.orange;
              statusIcon = Icons.schedule;
          }

          final daysLate = int.parse(payment['daysLate']!);
          Color daysLateColor;
          if (daysLate == 0) {
            daysLateColor = Colors.green;
          } else if (daysLate <= 15) {
            daysLateColor = Colors.green;
          } else if (daysLate <= 30) {
            daysLateColor = Colors.yellow.shade700;
          } else if (daysLate <= 60) {
            daysLateColor = Colors.orange;
          } else {
            daysLateColor = Colors.red;
          }

          return Card(
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: statusColor.withValues(alpha: 0.1),
                child: Icon(statusIcon, color: statusColor),
              ),
              title: Text(
                '${payment['investor']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${payment['type']} • ${payment['property']}',
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${payment['amount']} EGP',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  if (daysLate > 0)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: daysLateColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$daysLate days',
                        style: TextStyle(
                          color: daysLateColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildPaymentDetail('Payment ID', payment['id']!),
                      _buildPaymentDetail('Property', payment['property']!),
                      _buildPaymentDetail('Type', payment['type']!),
                      _buildPaymentDetail(
                        'Amount',
                        '${payment['amount']} EGP',
                      ),
                      _buildPaymentDetail(
                        'Expected Date',
                        payment['expected']!,
                      ),
                      _buildPaymentDetail(
                        'Actual Date',
                        payment['actual']!,
                      ),
                      _buildPaymentDetail('Status', payment['status']!),
                      if (daysLate > 0)
                        _buildPaymentDetail(
                          'Days Late',
                          '${payment['daysLate']} days',
                          valueColor: daysLateColor,
                        ),
                      if (payment['lateFee'] != '0')
                        _buildPaymentDetail(
                          'Late Fee (5%)',
                          '${payment['lateFee']} EGP',
                          valueColor: Colors.red,
                        ),
                      const SizedBox(height: 12),
                      if (payment['status'] != 'Received')
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.payment),
                            label: const Text('Record Payment'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1A237E),
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentDetail(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// INVESTORS SCREEN
// ============================================================================

class InvestorsScreen extends StatelessWidget {
  const InvestorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final investors = [
      {
        'name': 'Eng. Mostafa Al-Qadi',
        'email': 'mostafa.alqadi@example.com',
        'phone': '+20 100 123 4567',
        'investment': '7,000,000',
        'properties': '2',
        'portfolio': '7,700,000',
        'roi': '10.00%',
        'rating': '⭐⭐⭐⭐',
      },
      {
        'name': 'Mohamed Maisara',
        'email': 'm.maisara@crystalpower.com',
        'phone': '+20 100 234 5678',
        'investment': '8,700,000',
        'properties': '2',
        'portfolio': '9,800,000',
        'roi': '12.64%',
        'rating': '⭐⭐⭐⭐',
      },
      {
        'name': 'Abdelmohsen Group',
        'email': 'contact@abdelmohsengroup.com',
        'phone': '+20 100 345 6789',
        'investment': '14,800,000',
        'properties': '2',
        'portfolio': '15,000,000',
        'roi': '1.35%',
        'rating': '⭐⭐⭐',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Investors'),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: investors.length,
        itemBuilder: (context, index) {
          final investor = investors[index];
          final roiValue = double.parse(
            investor['roi']!.replaceAll('%', ''),
          );

          Color roiColor;
          if (roiValue > 100) {
            roiColor = Colors.green;
          } else if (roiValue > 50) {
            roiColor = Colors.lightGreen;
          } else if (roiValue > 10) {
            roiColor = Colors.orange;
          } else {
            roiColor = Colors.red;
          }

          return Card(
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF1A237E),
                child: Text(
                  investor['name']!.substring(0, 1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                investor['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${investor['properties']} Properties • ROI: ${investor['roi']}',
              ),
              trailing: Text(
                investor['rating']!,
                style: const TextStyle(fontSize: 16),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildInvestorDetail('Email', investor['email']!),
                      _buildInvestorDetail('Phone', investor['phone']!),
                      const Divider(height: 24),
                      _buildInvestorDetail(
                        'Total Investment',
                        '${investor['investment']} EGP',
                      ),
                      _buildInvestorDetail(
                        'Number of Properties',
                        investor['properties']!,
                      ),
                      _buildInvestorDetail(
                        'Portfolio Value',
                        '${investor['portfolio']} EGP',
                      ),
                      _buildInvestorDetail(
                        'Portfolio ROI',
                        investor['roi']!,
                        valueColor: roiColor,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.email),
                              label: const Text('Email'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.phone),
                              label: const Text('Call'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1A237E),
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInvestorDetail(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
