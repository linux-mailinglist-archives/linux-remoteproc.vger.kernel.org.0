Return-Path: <linux-remoteproc+bounces-6287-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOCoAr/MeGmNtQEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6287-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Tue, 27 Jan 2026 15:33:35 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2E95C73
	for <lists+linux-remoteproc@lfdr.de>; Tue, 27 Jan 2026 15:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC8D33106AA3
	for <lists+linux-remoteproc@lfdr.de>; Tue, 27 Jan 2026 14:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBE235B62A;
	Tue, 27 Jan 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKsi0GLA"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70633587A4;
	Tue, 27 Jan 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524057; cv=none; b=gBUNp9wsZAV89g+n88H+Lacpm/Ruc7vJ/42/jo5frUOHuschGgX8DJsy265OG3snAAYWAzdb3pAFKBNPm+hp4FXvpz/ZUtP+v7p5u1SqRV+zKAnivVheFDeZ+cGHJfkQUTUj/rV6NrStW3Zi4l5aK+8apI5qGpmoJ3UCKRiOQB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524057; c=relaxed/simple;
	bh=Oj9TkAQFh/6cwYhLTIR5NHFiC5n1b/LDShRio/u/mQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXXDmFvCSYrsKZMEMCGSu+WBjA+477zU2TjAeg2r0WRJ+dKnPvRB37T0dUVCTaZa2i0xp+Kzwy/IssGvOSAxW1TZ+H8hgEstU+SYbbGC6eu7j3H06jab+m6h9H7dAIEwDs5R7j76sXQK9EeoQf+HBQwdgMe43swn0pL8IPvfIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKsi0GLA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769524056; x=1801060056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oj9TkAQFh/6cwYhLTIR5NHFiC5n1b/LDShRio/u/mQ4=;
  b=gKsi0GLAaqLw3dqxUipl+AXQF4cj0B+ixe7ZhlEgG+qNdD7Hqfd476/j
   yXUZ1nV/DAY4P5afOwmyjgiWESCD8iWxDUyYAH6scHrI7SfxuX7H77fLc
   3gnYk5Xco5D4RafMnLPalhHND41Rk6K1Jkg6cTQGGQeT53GPlpkJsjO1G
   QG2audV/EEs0fWHKd3Pq1t6FTSPwrK0kUeJar2JVj/4b7IDAiuzVCSNhX
   lstLgMMLgKiwYUybUIrHS5ZvcEJlYtcjw2CzjlOlVoJsPq/mSblAoC5Y9
   BuFFLnn9jgjcyRzedrH4ddvBZq31g7VdvpKEzRZxfKzr28EkGbHnwZ5me
   g==;
X-CSE-ConnectionGUID: gfF0ZeOGR3OGxTR7Y+A/zQ==
X-CSE-MsgGUID: 1w8z3peOSZW9ropr0LrylA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70776383"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70776383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 06:27:35 -0800
X-CSE-ConnectionGUID: g9zrPLsGQbODc6ytgi3/Lw==
X-CSE-MsgGUID: asGUUgs2SNSq5EyyMjn0xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208006178"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jan 2026 06:27:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkk2T-00000000YYe-1Lj9;
	Tue, 27 Jan 2026 14:27:29 +0000
Date: Tue, 27 Jan 2026 22:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] remoteproc: add support for Microchip IPC
 remoteproc platform driver
Message-ID: <202601272218.wltjn3d3-lkp@intel.com>
References: <20260126120658.1674253-3-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126120658.1674253-3-valentina.fernandezalanis@microchip.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6287-lists,linux-remoteproc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-remoteproc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,git-scm.com:url]
X-Rspamd-Queue-Id: 5CF2E95C73
X-Rspamd-Action: no action

Hi Valentina,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentina-Fernandez/dt-bindings-remoteproc-add-Microchip-IPC-remoteproc/20260126-201137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20260126120658.1674253-3-valentina.fernandezalanis%40microchip.com
patch subject: [PATCH v3 2/2] remoteproc: add support for Microchip IPC remoteproc platform driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260127/202601272218.wltjn3d3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272218.wltjn3d3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272218.wltjn3d3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/remoteproc/mchp_remoteproc.c:23:10: fatal error: asm/sbi.h: No such file or directory
      23 | #include <asm/sbi.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +23 drivers/remoteproc/mchp_remoteproc.c

    22	
  > 23	#include <asm/sbi.h>
    24	#include <asm/vendorid_list.h>
    25	#include <linux/mailbox/mchp-ipc.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

