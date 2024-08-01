Return-Path: <linux-remoteproc+bounces-1891-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E1943EC1
	for <lists+linux-remoteproc@lfdr.de>; Thu,  1 Aug 2024 03:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83DDC28226B
	for <lists+linux-remoteproc@lfdr.de>; Thu,  1 Aug 2024 01:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200EF1A4F33;
	Thu,  1 Aug 2024 00:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPkHIxz4"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9A1DA57B;
	Thu,  1 Aug 2024 00:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722472489; cv=none; b=hy+T5DNaB7tX0adIAAUi1hhgjpxg80vh6ZAPLdMvtDDPbTSMrTmjvm5dBwOMP5OIwQmPUAcs3YUYddG9a8kUzyUIiIq02DmLrO7jjjbJ7kVRJzI32oRQWaTEyXt0tLEByAQ6yhjMhEIiY0Pb+WEW2r6QZwRG1vjmpVPy/+/nNJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722472489; c=relaxed/simple;
	bh=3dNmDyrVzL/5VJctZY1xc/77qmq5Zday9dQ7WM40AEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZedgJOPrqYMPxJz+D/f1K/o29fnfbM5QcYhtJJtMIS0PrwKYYBlGw/0hYktAItRRZelNtowiCS+uxhSIufB8VXQKM74JcdzqmEppwBspQSeYYB/H2YC5pc8R91RtdW1D9ofp+fROs0s0RP4C6lyH8LLgvz5V1k6i0uNGuC0Vlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPkHIxz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AF0C4AF10;
	Thu,  1 Aug 2024 00:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722472488;
	bh=3dNmDyrVzL/5VJctZY1xc/77qmq5Zday9dQ7WM40AEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LPkHIxz42ScdWAL1fQrSEs6jbkPOUxcRgjrTUUfpLaEOQhhEQjNIrqkrQbizkQ4yx
	 fmVW1LGWigG+0OKZ+17dEHscihm0uUy4IWeIghCMirIchNrpJ80Ss7QX1p8H7g2U2x
	 bwylQXe3jpcJFvdarMhtqwalkvC/zMVpRTFr1reg6l0DGmoTCfEgycgR9IaCSeCGAu
	 miS+hBc5kt7u/W4qbRMhj0Xmjxj/mhzf5BwQwjTooJ0UgfNJ3z486mIfE83er2QO+B
	 0N6Jxn3IU6oObl00E9BqoM+eBIdfcJsZg0J7jCRzmmT7kJeqFP4X8iczegLD/lRrVR
	 1MuEVlzPU1ZAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Maina <quic_rmaina@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 26/47] hwspinlock: Introduce hwspin_lock_bust()
Date: Wed, 31 Jul 2024 20:31:16 -0400
Message-ID: <20240801003256.3937416-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801003256.3937416-1-sashal@kernel.org>
References: <20240801003256.3937416-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
Content-Transfer-Encoding: 8bit

From: Richard Maina <quic_rmaina@quicinc.com>

[ Upstream commit 7c327d56597d8de1680cf24e956b704270d3d84a ]

When a remoteproc crashes or goes down unexpectedly this can result in
a state where locks held by the remoteproc will remain locked possibly
resulting in deadlock. This new API hwspin_lock_bust() allows
hwspinlock implementers to define a bust operation for freeing previously
acquired hwspinlocks after verifying ownership of the acquired lock.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
Link: https://lore.kernel.org/r/20240529-hwspinlock-bust-v3-1-c8b924ffa5a2@quicinc.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/locking/hwspinlock.rst     | 11 ++++++++++
 drivers/hwspinlock/hwspinlock_core.c     | 28 ++++++++++++++++++++++++
 drivers/hwspinlock/hwspinlock_internal.h |  3 +++
 include/linux/hwspinlock.h               |  6 +++++
 4 files changed, 48 insertions(+)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index 6f03713b70039..2ffaa3cbd63f1 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -85,6 +85,17 @@ is already free).
 
 Should be called from a process context (might sleep).
 
+::
+
+  int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
+
+After verifying the owner of the hwspinlock, release a previously acquired
+hwspinlock; returns 0 on success, or an appropriate error code on failure
+(e.g. -EOPNOTSUPP if the bust operation is not defined for the specific
+hwspinlock).
+
+Should be called from a process context (might sleep).
+
 ::
 
   int hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int timeout);
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index fd5f5c5a5244d..425597151dd3e 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -302,6 +302,34 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 }
 EXPORT_SYMBOL_GPL(__hwspin_unlock);
 
+/**
+ * hwspin_lock_bust() - bust a specific hwspinlock
+ * @hwlock: a previously-acquired hwspinlock which we want to bust
+ * @id: identifier of the remote lock holder, if applicable
+ *
+ * This function will bust a hwspinlock that was previously acquired as
+ * long as the current owner of the lock matches the id given by the caller.
+ *
+ * Context: Process context.
+ *
+ * Returns: 0 on success, or -EINVAL if the hwspinlock does not exist, or
+ * the bust operation fails, and -EOPNOTSUPP if the bust operation is not
+ * defined for the hwspinlock.
+ */
+int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id)
+{
+	if (WARN_ON(!hwlock))
+		return -EINVAL;
+
+	if (!hwlock->bank->ops->bust) {
+		pr_err("bust operation not defined\n");
+		return -EOPNOTSUPP;
+	}
+
+	return hwlock->bank->ops->bust(hwlock, id);
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_bust);
+
 /**
  * of_hwspin_lock_simple_xlate - translate hwlock_spec to return a lock id
  * @bank: the hwspinlock device bank
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index 29892767bb7a0..f298fc0ee5adb 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -21,6 +21,8 @@ struct hwspinlock_device;
  * @trylock: make a single attempt to take the lock. returns 0 on
  *	     failure and true on success. may _not_ sleep.
  * @unlock:  release the lock. always succeed. may _not_ sleep.
+ * @bust:    optional, platform-specific bust handler, called by hwspinlock
+ *	     core to bust a specific lock.
  * @relax:   optional, platform-specific relax handler, called by hwspinlock
  *	     core while spinning on a lock, between two successive
  *	     invocations of @trylock. may _not_ sleep.
@@ -28,6 +30,7 @@ struct hwspinlock_device;
 struct hwspinlock_ops {
 	int (*trylock)(struct hwspinlock *lock);
 	void (*unlock)(struct hwspinlock *lock);
+	int (*bust)(struct hwspinlock *lock, unsigned int id);
 	void (*relax)(struct hwspinlock *lock);
 };
 
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index bfe7c1f1ac6d1..f0231dbc47771 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -68,6 +68,7 @@ int __hwspin_lock_timeout(struct hwspinlock *, unsigned int, int,
 int __hwspin_trylock(struct hwspinlock *, int, unsigned long *);
 void __hwspin_unlock(struct hwspinlock *, int, unsigned long *);
 int of_hwspin_lock_get_id_byname(struct device_node *np, const char *name);
+int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
 struct hwspinlock *devm_hwspin_lock_request(struct device *dev);
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
@@ -127,6 +128,11 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 {
 }
 
+static inline int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id)
+{
+	return 0;
+}
+
 static inline int of_hwspin_lock_get_id(struct device_node *np, int index)
 {
 	return 0;
-- 
2.43.0


