import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

/// Rotating daily inspirational quote widget.
/// Shows a different quote each day based on the day of year.
class DailyQuote extends StatelessWidget {
  const DailyQuote({super.key});

  static const _quotes = [
    ('The secret of getting ahead is getting started.', 'Mark Twain'),
    ('It is during our darkest moments that we must focus to see the light.', 'Aristotle'),
    ('The only way to do great work is to love what you do.', 'Steve Jobs'),
    ('Innovation distinguishes between a leader and a follower.', 'Steve Jobs'),
    ('Life is what happens when you\'re busy making other plans.', 'John Lennon'),
    ('The future belongs to those who believe in the beauty of their dreams.', 'Eleanor Roosevelt'),
    ('It is never too late to be what you might have been.', 'George Eliot'),
    ('You miss 100% of the shots you don\'t take.', 'Wayne Gretzky'),
    ('The most difficult thing is the decision to act.', 'Amelia Earhart'),
    ('Believe you can and you\'re halfway there.', 'Theodore Roosevelt'),
    ('Everything you\'ve ever wanted is on the other side of fear.', 'George Addair'),
    ('Success is not final, failure is not fatal: it is the courage to continue that counts.', 'Winston Churchill'),
    ('The best time to plant a tree was 20 years ago. The second best time is now.', 'Chinese Proverb'),
    ('Your time is limited, don\'t waste it living someone else\'s life.', 'Steve Jobs'),
    ('If you look at what you have in life, you\'ll always have more.', 'Oprah Winfrey'),
    ('If you set your goals ridiculously high and it\'s a failure, you will fail above everyone else\'s success.', 'James Cameron'),
    ('Life is either a daring adventure or nothing at all.', 'Helen Keller'),
    ('You must be the change you wish to see in the world.', 'Mahatma Gandhi'),
    ('Spread love everywhere you go. Let no one ever come to you without leaving happier.', 'Mother Teresa'),
    ('Always remember that you are absolutely unique. Just like everyone else.', 'Margaret Mead'),
    ('The greatest glory in living lies not in never falling, but in rising every time we fall.', 'Nelson Mandela'),
    ('The way to get started is to quit talking and begin doing.', 'Walt Disney'),
    ('If life were predictable it would cease to be life, and be without flavor.', 'Eleanor Roosevelt'),
    ('If you really look closely, most overnight successes took a long time.', 'Steve Jobs'),
    ('The prompt stitch in time saves nine.', 'Benjamin Franklin'),
    ('Don\'t judge each day by the harvest you reap but by the seeds that you plant.', 'Robert Louis Stevenson'),
    ('The journey of a thousand miles begins with a single step.', 'Lao Tzu'),
    ('What we think, we become.', 'Buddha'),
    ('Happiness is not something ready made. It comes from your own actions.', 'Dalai Lama'),
    ('The only impossible journey is the one you never begin.', 'Tony Robbins'),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year)).inDays;
    final quote = _quotes[dayOfYear % _quotes.length];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontalPadding,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.withValues(alpha: 0.06),
              Colors.indigo.withValues(alpha: 0.04),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.purple.withValues(alpha: 0.12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.format_quote_rounded,
                  size: 20,
                  color: Colors.purple.shade400,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  l10n.dailyQuoteTitle,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: context.colorTextSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '"${quote.$1}"',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '— ${quote.$2}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: context.colorTextMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
