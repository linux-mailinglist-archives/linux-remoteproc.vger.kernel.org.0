Return-Path: <linux-remoteproc+bounces-1955-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28EB94E7E0
	for <lists+linux-remoteproc@lfdr.de>; Mon, 12 Aug 2024 09:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24574B20C64
	for <lists+linux-remoteproc@lfdr.de>; Mon, 12 Aug 2024 07:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6E814F9DC;
	Mon, 12 Aug 2024 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAJc3bAf"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A314F138;
	Mon, 12 Aug 2024 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723447923; cv=none; b=Od4+rv8zBT4uU4ihK0kZYh0teW+UbpkaA/wzH8TxlzWREAex3UCucUZXze5Yb3BEKr4LNo030l5EKPk4q9tYCxHYWZ9S4sFrV/L0HFpVb2ksmgRGOshpNKVwlwrOUBbL5rlQVjPnVMQIogv6Fh++AhbaHN+Rnq9zBqR8oA2g5KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723447923; c=relaxed/simple;
	bh=YICp9joOECakgIGokpdFofJxcmG9NCv1dYggMCI17Uc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fvvPds1hpy23gwt53YTOtUSD5d0Di78b/PdwgXphtO6V8FUeKxUJdSOz458+0KgwUhQ8MLsb9W7tsgyxeuqo/skNgQ/h3z2bTU62Ia2Ey5Tv1dBThx5YUPUHi7orstFmZD8kfIauERbVh1uxXIzcLUCSZ+CR1Mjik8Trg1xLtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAJc3bAf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723447921; x=1754983921;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YICp9joOECakgIGokpdFofJxcmG9NCv1dYggMCI17Uc=;
  b=jAJc3bAfqSsvy+PCUQ2mlOtwN7aMEbIkrUfQBT0VBnSvcJI6hAOH4Dkg
   hFs6s3dTyt7jR45Z8zNKqTWpi9KTA05XS2Lg3giHBFSo8Tzmz6HmvRTRV
   j6p6E8TiOFmWo7TPkdLh3QQ56uWHLbFj++mMGLzQ2jfuRawbTSHeaBEHM
   WXMDnSmi4AtAgN/RpWOWLxF3f5a9teT9HQRqDFqeAn+kYOs+Y1vLMYC+T
   IwrIyx1tpQG0SoTgueUTqG8JrdxEnpv1c5Ev6lEAXOGINcYsbBZsj8/07
   F3VPxlwspcKVMFm8dWiIJbjdPASSDfZHleE8IQKdgu4ASXg9rgyCsF1MZ
   A==;
X-CSE-ConnectionGUID: an98I38zSy2eu9NRr3+stQ==
X-CSE-MsgGUID: 666yAXVbRaSFkdcFsyxWXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="46942859"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="46942859"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 00:32:00 -0700
X-CSE-ConnectionGUID: rpnO7eRTSpOQFjsZp8jpOg==
X-CSE-MsgGUID: +Ty6jrrYQwuE5rsEJehuaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62832178"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2024 00:31:42 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: linux-remoteproc@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH 1/1] remoteproc: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:28:11 +0800
Message-Id: <20240812072811.9737-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An iommu domain is allocated in rproc_enable_iommu() and is attached to
rproc->dev.parent in the same function.

Use iommu_paging_domain_alloc() to make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20240610085555.88197-13-baolu.lu@linux.intel.com
---
 drivers/remoteproc/remoteproc_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f276956f2c5c..eb66f78ec8b7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -109,10 +109,10 @@ static int rproc_enable_iommu(struct rproc *rproc)
 		return 0;
 	}
 
-	domain = iommu_domain_alloc(dev->bus);
-	if (!domain) {
+	domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(domain)) {
 		dev_err(dev, "can't alloc iommu domain\n");
-		return -ENOMEM;
+		return PTR_ERR(domain);
 	}
 
 	iommu_set_fault_handler(domain, rproc_iommu_fault, rproc);
-- 
2.34.1


