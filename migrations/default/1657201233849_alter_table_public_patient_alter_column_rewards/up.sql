alter table "public"."patient" alter column "rewards" set default '[{"isUnlocked":false,"isAccessed":false,"isViewed":false,"tier":"bronze","description":"10% off on all therapy equipment from EXERTOOLS","unlockAtDayCompleted":5},{"isUnlocked":false,"isAccessed":false,"isViewed":false,"tier":"silver","description":"15% off on all therapy equipment from EXERTOOLS","unlockAtDayCompleted":10},{"isUnlocked":false,"isAccessed":false,"isViewed":false,"tier":"gold","description":"20% off on all therapy equipment from EXERTOOLS","unlockAtDayCompleted":15}]';