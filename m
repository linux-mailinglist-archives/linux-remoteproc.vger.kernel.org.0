Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358D21F13F9
	for <lists+linux-remoteproc@lfdr.de>; Mon,  8 Jun 2020 09:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbgFHHvR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 8 Jun 2020 03:51:17 -0400
Received: from mga06.intel.com ([134.134.136.31]:38575 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728951AbgFHHvQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 03:51:16 -0400
IronPort-SDR: uQHGLWXe9Hf7bTTzSJyC4Nq832RIfEfritw0DZgGmv/zx8qgB2U39ETtx+DODX95lYmc4CNKp3
 6eL4QZlStyGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 00:51:16 -0700
IronPort-SDR: J7xTZnEdqVyVsjR/v7xXEThjCvks55BJCzCPQZXSJRw3rPYbRoF8usT1rz1krUB/qdR2J44aPv
 Ie3RqCD0n5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="446644066"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.46.212])
  by orsmga005.jf.intel.com with ESMTP; 08 Jun 2020 00:51:15 -0700
Date:   Mon, 8 Jun 2020 09:51:13 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-remoteproc@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>
Subject: VirtIO RPMsg VirtQ endianness
Message-ID: <20200608075113.GB10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Ohad,

In his comments to my recent vhost RPMsg API patch-set update Michael 
Tsirkin commented [1], that messages in the RPMsg over VirtIO case 
should be sent in the LE format. Could you please confirm that you agree 
with this comment? I'll then go ahead and patch virtio_rpmsg_bus.c firat 
and then also update my patch-set. In fact you can just reply to the 
original thread - you're on CC for it too.

Thanks
Guennadi

[1] https://www.spinics.net/lists/kvm/msg217704.html
