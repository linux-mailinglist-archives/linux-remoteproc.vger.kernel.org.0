Return-Path: <linux-remoteproc+bounces-6901-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HPTNCCIsWmjCwAAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6901-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Wed, 11 Mar 2026 16:20:00 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3BF266573
	for <lists+linux-remoteproc@lfdr.de>; Wed, 11 Mar 2026 16:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 316AE3006988
	for <lists+linux-remoteproc@lfdr.de>; Wed, 11 Mar 2026 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D292C08A2;
	Wed, 11 Mar 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c05EwYSj"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1228000F;
	Wed, 11 Mar 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242376; cv=none; b=qiKSWuYXxQj8oxBYG+gIWa83LeB6E2KZB4t9ykpluMgGZKxWRMGw6whBTz1QYC77IEvriZy1X2Wf25YPWKoKFjzPnL1I3bof2qTc4vQNUL+z+WtXOlt4xLx3Y5MXqBoWf2jdxDob+7FNeL9I/izKHLB+HiclyESNtsSEh7BRyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242376; c=relaxed/simple;
	bh=lZGAKZNNBMzzahzkxmyAkS4p2ouXVw+Q9VeEoZYT90Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YWAfAao+Ps3DgvrfIoxYbZSwiWCBgnvvks4p8VKXUxMuIEXPo5BaDQDg4jouaJxJUiZTPo28ueXWAXrte56ZdMyiHcld2C2V/8BxmkQkWI9aHXi68z2ngcwo/3dvmwThysPo4734pSNmqbyOGHdUfQcHRJRpM1mdBTr/MD6qVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c05EwYSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B169C4CEF7;
	Wed, 11 Mar 2026 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242376;
	bh=lZGAKZNNBMzzahzkxmyAkS4p2ouXVw+Q9VeEoZYT90Q=;
	h=From:To:Cc:Subject:Date:From;
	b=c05EwYSjDtfmXHW89XKcVmZp7cmVhR6uq0BgwmTJJRJLujdUJxUxpLNG4V/sOWh1l
	 au44+0Rgf3EXtyoM9DL35mMhehNZmT0lFqGXdQfI9OCanHICG1Ut/n5JSdFWx4gVOC
	 ree0iTvFl0MtJdqtO4VRoSycu13RgSHBe8reuQUHkgu5/TuQIRFMv02fxthgOVsaM0
	 R9hFM9cEglycyxZbBBC8F6EWXrH+L2y6hJ7T9LtHchM5dxUZL/O485ZzX5HP8VRwAo
	 CzH5dBrHX5gCiUMkyvJyBkpE0qqp+ZWQY25zhQH3Deh5/ZCmh81ONrgYwgxQJAoEdf
	 JRCC4jkBDJnow==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [GIT PULL] remoteproc fixes for v7.0
Date: Wed, 11 Mar 2026 10:19:33 -0500
Message-ID: <20260311151933.26814-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6901-lists,linux-remoteproc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-remoteproc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: EB3BF266573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.0-fixes

for you to fetch changes up to 97e4567d39941248579da34b7fbb568e6659511e:

  remoteproc: imx_rproc: Fix unreachable platform prepare_ops (2026-03-05 10:18:23 -0700)

----------------------------------------------------------------
remoteproc fixes for v7.0

Correct the early return from the i.MX remoteproc prepare operation,
which prevented the platform-specific prepare function to be reached.

Ensure that the Mediatek SCP clock is released during system suspend,
after the recent refactoring to avoid issues with the clock framework's
prepare lock.

Correct the type of the subsys_name_len field in the sysmon event
QMI message, as the recent introduction of big endian support in the QMI
encoder highlighted the type mismatch and resulted in a failure to
encode the message.

Roll back the devm_ioremap_resource_wc() to a devm_ioremap_wc() in the
Qualcomm WCNSS remoteproc driver, after reports that requesting this
resource fails on some platforms.

----------------------------------------------------------------
Bjorn Andersson (1):
      remoteproc: sysmon: Correct subsys_name_len type in QMI request

Peng Fan (1):
      remoteproc: imx_rproc: Fix unreachable platform prepare_ops

Rob Herring (Arm) (1):
      remoteproc: qcom_wcnss: Fix reserved region mapping failure

Tzung-Bi Shih (1):
      remoteproc: mediatek: Unprepare SCP clock during system suspend

 drivers/remoteproc/imx_rproc.c   |  2 +-
 drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_sysmon.c |  2 +-
 drivers/remoteproc/qcom_wcnss.c  |  2 +-
 4 files changed, 42 insertions(+), 3 deletions(-)

