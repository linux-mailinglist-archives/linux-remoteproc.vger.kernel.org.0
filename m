Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55CF1AC4DF
	for <lists+linux-remoteproc@lfdr.de>; Thu, 16 Apr 2020 16:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409673AbgDPOGb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 10:06:31 -0400
Received: from mga12.intel.com ([192.55.52.136]:57899 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409596AbgDPOGO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 10:06:14 -0400
IronPort-SDR: P12HGTPHeD+3SbNvO/R5cs1nhQIEXlA5+Q+XfesHDFgwd7ctVnv5qejablnTz8RXFv1UpSUXuW
 roY6iIFVgkzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 07:06:13 -0700
IronPort-SDR: sHk0TZKb8Kq4daEC5/xogA3fid1YQmdVpSDmmspP84Bz7VDi5CrqQV4q1EzqechH6whNu0kXRx
 cSoplxp+iKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,391,1580803200"; 
   d="scan'208";a="244405445"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.43.195])
  by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2020 07:05:32 -0700
Date:   Thu, 16 Apr 2020 16:05:30 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     linux-remoteproc@vger.kernel.org
Subject: RPMSG over VirtIO under KVM
Message-ID: <20200416140307.GA25561@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

It has been proposed to port the VirtIO SOF driver [1], used to 
implement audio support under Linux, running in a KVM guest, to use 
RPMSG to communicate with the SOF vhost driver, running on the Linux 
host. On one hand I see an rpmsg-virtio driver, which should make such 
a port possible, on the other hand I don't see a single VirtIO driver 
in the kernel, using RPMSG for Linux virtualisation.

Hence my questions: is this a good idea? Is there anything in the 
kernel VirtIO RPMSG implementation, that would make this impossible?

Thanks
Guennadi

[1] https://thesofproject.github.io/latest/developer_guides/virtualization/virtualization.html
