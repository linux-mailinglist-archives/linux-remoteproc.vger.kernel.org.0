Return-Path: <linux-remoteproc+bounces-66-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615A8066B8
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Dec 2023 06:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66959B20D83
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Dec 2023 05:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B57107A4;
	Wed,  6 Dec 2023 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sZDfgOyK"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A288018F;
	Tue,  5 Dec 2023 21:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=BAXtbSw9W5xw6W6eD0JYuFWJgJP0GI7JxlqByr7InSw=; b=sZDfgOyKcv2BfxqKTOQXpWJnTB
	7buDvIU661JK49ilVMJe5FE694qfTCliNAUbznjJQdWGCNiGVLAirxbl2P9bF6Zj1Zg878isXW1cQ
	fuM4/ZAb5DFr6nrISqAIOWTpbTfJgjoOv+h9hVwxZSL14Qh09oGT9B7qJFyZLa4NOP4UBx+g3y69B
	B3uSOV0+1JvYWcCnm/XPvaIzo62UNv/nVJnx3mjiibOGLm8PtUKqOg2Z6Jw2deijbvNneqKYAuRJY
	5SkYgsNOmuVWvCCzmpuwNZbNfyAO2ZvJCdY0GhiRFb5Ux+4kqFc4zmCH1lqUUhyzxT0wAeSw/THP5
	ZgY2mNdg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkro-0098PV-1M;
	Wed, 06 Dec 2023 05:54:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang7@gmail.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] hwspinlock/core: fix kernel-doc warnings
Date: Tue,  5 Dec 2023 21:54:39 -0800
Message-ID: <20231206055439.671-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct function comments to prevent kernel-doc warnings
found when using "W=1".

hwspinlock_core.c:208: warning: Excess function parameter 'timeout' description in '__hwspin_lock_timeout'
hwspinlock_core.c:318: warning: Excess function parameter 'bank' description in 'of_hwspin_lock_simple_xlate'
hwspinlock_core.c:647: warning: Function parameter or member 'hwlock' not described in '__hwspin_lock_request'

and 17 warnings like:
hwspinlock_core.c:487: warning: No description found for return value of 'hwspin_lock_register'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
---
 drivers/hwspinlock/hwspinlock_core.c |   53 +++++++++++++------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff -- a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -84,8 +84,9 @@ static DEFINE_MUTEX(hwspinlock_tree_lock
  * should decide between spin_trylock, spin_trylock_irq and
  * spin_trylock_irqsave.
  *
- * Returns 0 if we successfully locked the hwspinlock or -EBUSY if
+ * Returns: %0 if we successfully locked the hwspinlock or -EBUSY if
  * the hwspinlock was already taken.
+ *
  * This function will never sleep.
  */
 int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
@@ -171,7 +172,7 @@ EXPORT_SYMBOL_GPL(__hwspin_trylock);
 /**
  * __hwspin_lock_timeout() - lock an hwspinlock with timeout limit
  * @hwlock: the hwspinlock to be locked
- * @timeout: timeout value in msecs
+ * @to: timeout value in msecs
  * @mode: mode which controls whether local interrupts are disabled or not
  * @flags: a pointer to where the caller's interrupt state will be saved at (if
  *         requested)
@@ -199,9 +200,11 @@ EXPORT_SYMBOL_GPL(__hwspin_trylock);
  * to choose the appropriate @mode of operation, exactly the same way users
  * should decide between spin_lock, spin_lock_irq and spin_lock_irqsave.
  *
- * Returns 0 when the @hwlock was successfully taken, and an appropriate
+ * Returns: %0 when the @hwlock was successfully taken, and an appropriate
  * error code otherwise (most notably -ETIMEDOUT if the @hwlock is still
- * busy after @timeout msecs). The function will never sleep.
+ * busy after @timeout msecs).
+ *
+ * The function will never sleep.
  */
 int __hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int to,
 					int mode, unsigned long *flags)
@@ -304,13 +307,12 @@ EXPORT_SYMBOL_GPL(__hwspin_unlock);
 
 /**
  * of_hwspin_lock_simple_xlate - translate hwlock_spec to return a lock id
- * @bank: the hwspinlock device bank
  * @hwlock_spec: hwlock specifier as found in the device tree
  *
  * This is a simple translation function, suitable for hwspinlock platform
  * drivers that only has a lock specifier length of 1.
  *
- * Returns a relative index of the lock within a specified bank on success,
+ * Returns: a relative index of the lock within a specified bank on success,
  * or -EINVAL on invalid specifier cell count.
  */
 static inline int
@@ -332,9 +334,10 @@ of_hwspin_lock_simple_xlate(const struct
  * hwspinlock device, so that it can be requested using the normal
  * hwspin_lock_request_specific() API.
  *
- * Returns the global lock id number on success, -EPROBE_DEFER if the hwspinlock
- * device is not yet registered, -EINVAL on invalid args specifier value or an
- * appropriate error as returned from the OF parsing of the DT client node.
+ * Returns: the global lock id number on success, -EPROBE_DEFER if the
+ * hwspinlock device is not yet registered, -EINVAL on invalid args
+ * specifier value or an appropriate error as returned from the OF parsing
+ * of the DT client node.
  */
 int of_hwspin_lock_get_id(struct device_node *np, int index)
 {
@@ -399,9 +402,10 @@ EXPORT_SYMBOL_GPL(of_hwspin_lock_get_id)
  * the hwspinlock device, so that it can be requested using the normal
  * hwspin_lock_request_specific() API.
  *
- * Returns the global lock id number on success, -EPROBE_DEFER if the hwspinlock
- * device is not yet registered, -EINVAL on invalid args specifier value or an
- * appropriate error as returned from the OF parsing of the DT client node.
+ * Returns: the global lock id number on success, -EPROBE_DEFER if the
+ * hwspinlock device is not yet registered, -EINVAL on invalid args
+ * specifier value or an appropriate error as returned from the OF parsing
+ * of the DT client node.
  */
 int of_hwspin_lock_get_id_byname(struct device_node *np, const char *name)
 {
@@ -481,7 +485,7 @@ out:
  *
  * Should be called from a process context (might sleep)
  *
- * Returns 0 on success, or an appropriate error code on failure
+ * Returns: %0 on success, or an appropriate error code on failure
  */
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		const struct hwspinlock_ops *ops, int base_id, int num_locks)
@@ -529,7 +533,7 @@ EXPORT_SYMBOL_GPL(hwspin_lock_register);
  *
  * Should be called from a process context (might sleep)
  *
- * Returns 0 on success, or an appropriate error code on failure
+ * Returns: %0 on success, or an appropriate error code on failure
  */
 int hwspin_lock_unregister(struct hwspinlock_device *bank)
 {
@@ -578,7 +582,7 @@ static int devm_hwspin_lock_device_match
  *
  * Should be called from a process context (might sleep)
  *
- * Returns 0 on success, or an appropriate error code on failure
+ * Returns: %0 on success, or an appropriate error code on failure
  */
 int devm_hwspin_lock_unregister(struct device *dev,
 				struct hwspinlock_device *bank)
@@ -607,7 +611,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unreg
  *
  * Should be called from a process context (might sleep)
  *
- * Returns 0 on success, or an appropriate error code on failure
+ * Returns: %0 on success, or an appropriate error code on failure
  */
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
@@ -635,12 +639,13 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_regis
 
 /**
  * __hwspin_lock_request() - tag an hwspinlock as used and power it up
+ * @hwlock: the target hwspinlock
  *
  * This is an internal function that prepares an hwspinlock instance
  * before it is given to the user. The function assumes that
  * hwspinlock_tree_lock is taken.
  *
- * Returns 0 or positive to indicate success, and a negative value to
+ * Returns: %0 or positive to indicate success, and a negative value to
  * indicate an error (with the appropriate error code)
  */
 static int __hwspin_lock_request(struct hwspinlock *hwlock)
@@ -680,7 +685,7 @@ static int __hwspin_lock_request(struct
  * hwspin_lock_get_id() - retrieve id number of a given hwspinlock
  * @hwlock: a valid hwspinlock instance
  *
- * Returns the id number of a given @hwlock, or -EINVAL if @hwlock is invalid.
+ * Returns: the id number of a given @hwlock, or -EINVAL if @hwlock is invalid.
  */
 int hwspin_lock_get_id(struct hwspinlock *hwlock)
 {
@@ -704,7 +709,7 @@ EXPORT_SYMBOL_GPL(hwspin_lock_get_id);
  *
  * Should be called from a process context (might sleep)
  *
- * Returns the address of the assigned hwspinlock, or NULL on error
+ * Returns: the address of the assigned hwspinlock, or %NULL on error
  */
 struct hwspinlock *hwspin_lock_request(void)
 {
@@ -747,7 +752,7 @@ EXPORT_SYMBOL_GPL(hwspin_lock_request);
  *
  * Should be called from a process context (might sleep)
  *
- * Returns the address of the assigned hwspinlock, or NULL on error
+ * Returns: the address of the assigned hwspinlock, or %NULL on error
  */
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 {
@@ -795,7 +800,7 @@ EXPORT_SYMBOL_GPL(hwspin_lock_request_sp
  *
  * Should be called from a process context (might sleep)
  *
- * Returns 0 on success, or an appropriate error code on failure
+ * Returns: %0 on success, or an appropriate error code on failure
  */
 int hwspin_lock_free(struct hwspinlock *hwlock)
 {
@@ -865,7 +870,7 @@ static void devm_hwspin_lock_release(str
  *
  * Should be called from a process context (might sleep)
  *
- * Returns 0 on success, or an appropriate error code on failure
+ * Returns: %0 on success, or an appropriate error code on failure
  */
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock)
 {
@@ -891,7 +896,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_free)
  *
  * Should be called from a process context (might sleep)
  *
- * Returns the address of the assigned hwspinlock, or NULL on error
+ * Returns: the address of the assigned hwspinlock, or %NULL on error
  */
 struct hwspinlock *devm_hwspin_lock_request(struct device *dev)
 {
@@ -926,7 +931,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_reque
  *
  * Should be called from a process context (might sleep)
  *
- * Returns the address of the assigned hwspinlock, or NULL on error
+ * Returns: the address of the assigned hwspinlock, or %NULL on error
  */
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id)

