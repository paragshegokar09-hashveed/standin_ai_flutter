import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _aiEnabled = true;

  final List<Map<String, dynamic>> _recentMeetings = [
    {
      'name': 'Rahul Sharma',
      'time': 'Today, 10:24 AM · 8 min',
      'mood': '😊',
      'icon': '📞',
      'fraud': false,
    },
    {
      'name': '+91 98123 45678',
      'time': 'Yesterday · 12 min',
      'mood': '😐',
      'icon': '📞',
      'fraud': false,
    },
    {
      'name': 'Unknown — Blocked',
      'time': 'Yesterday · Fraud detected',
      'mood': '🚫',
      'icon': '🚨',
      'fraud': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildAIToggle(),
                    const SizedBox(height: 20),
                    _buildStats(),
                    const SizedBox(height: 24),
                    _buildRecentMeetings(),
                    const SizedBox(height: 24),
                    _buildQuickSettings(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Good morning,',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
              Text(
                'Parag 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => _showSettingsMenu(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.purple, AppColors.teal],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'P',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIToggle() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.purple.withOpacity(0.15),
            AppColors.teal.withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.purple.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '🤖 AI Assistant',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _aiEnabled ? 'Ready to handle your calls' : 'Tap to enable AI',
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => setState(() => _aiEnabled = !_aiEnabled),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 52,
              height: 28,
              decoration: BoxDecoration(
                gradient: _aiEnabled
                    ? const LinearGradient(
                        colors: [AppColors.purple, AppColors.teal],
                      )
                    : null,
                color: _aiEnabled ? null : AppColors.border,
                borderRadius: BorderRadius.circular(14),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: _aiEnabled
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(3),
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        _statCard('24', 'Calls\nHandled', AppColors.teal),
        const SizedBox(width: 10),
        _statCard('3h 12m', 'Time\nSaved', AppColors.purple),
        const SizedBox(width: 10),
        _statCard('2', 'Frauds\nBlocked', AppColors.coral),
      ],
    );
  }

  Widget _statCard(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: AppDecorations.card,
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: AppColors.textMuted, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentMeetings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('RECENT MEETINGS', style: AppTextStyles.label),
        const SizedBox(height: 12),
        ..._recentMeetings.map((m) => _meetingItem(m)),
      ],
    );
  }

  Widget _meetingItem(Map<String, dynamic> m) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: AppDecorations.card,
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: m['fraud']
                  ? AppColors.coral.withOpacity(0.15)
                  : AppColors.purple.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(m['icon'], style: const TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  m['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  m['time'],
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(m['mood'], style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  Widget _buildQuickSettings() {
    final items = [
      {'icon': '🧠', 'title': 'AI Personality', 'route': '/personality'},
      {'icon': '📚', 'title': 'Knowledge Base', 'route': '/knowledge-base'},
      {'icon': '📅', 'title': 'Calendar', 'route': '/calendar'},
      {'icon': '📧', 'title': 'Gmail Summary', 'route': '/gmail-settings'},
      {'icon': '👆', 'title': 'Biometric Lock', 'route': '/biometric-lock'},
      {'icon': '🔒', 'title': 'Encryption', 'route': '/encryption'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('QUICK SETTINGS', style: AppTextStyles.label),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.1,
          children: items
              .map(
                (item) => GestureDetector(
                  onTap: () => Navigator.pushNamed(context, item['route']!),
                  child: Container(
                    decoration: AppDecorations.card,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['icon']!,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  void _showSettingsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bg2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        final items = [
          {'icon': '📞', 'title': 'Call Screening', 'route': '/call-screening'},
          {'icon': '🗑️', 'title': 'Data Expiry', 'route': '/data-expiry'},
          {'icon': '🔏', 'title': 'Watermarking', 'route': '/watermark'},
          {
            'icon': '📊',
            'title': 'Intelligence Report',
            'route': '/intelligence-report',
          },
        ];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            ...items.map(
              (item) => ListTile(
                leading: Text(
                  item['icon']!,
                  style: const TextStyle(fontSize: 22),
                ),
                title: Text(
                  item['title']!,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textMuted,
                  size: 14,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, item['route']!);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
