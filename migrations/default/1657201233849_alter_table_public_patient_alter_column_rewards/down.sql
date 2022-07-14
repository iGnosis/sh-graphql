alter table "public"."patient" alter column "rewards" set default '[{"tier": "bronze", "isAccessed": false, "isUnlocked": false, "description": "10% off on all therapy equipment from EXERTOOLS", "unlockAtDayCompleted": 5}, {"tier": "silver", "isAccessed": false, "isUnlocked": false, "description": "15% off on all therapy equipment from EXERTOOLS", "unlockAtDayCompleted": 10}, {"tier": "gold", "isAccessed": false, "isUnlocked": false, "description": "20% off on all therapy equipment from EXERTOOLS", "unlockAtDayCompleted": 15}]'::jsonb;