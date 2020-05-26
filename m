Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC991E2A17
	for <lists+linux-remoteproc@lfdr.de>; Tue, 26 May 2020 20:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbgEZSb5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 26 May 2020 14:31:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:31563 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728067AbgEZSb5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 26 May 2020 14:31:57 -0400
IronPort-SDR: AXpHdYO/XrAgUfTMkoDo8Gl7dKnlIGUzzcTylW+1aRHItE7ye+mfEkjkXU00619ubn+Nd4DtXL
 iVgfDL6jklzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 11:31:56 -0700
IronPort-SDR: WKGtEgFz1w41CKC1ilVbwQvSEF62g3vwneSO9znE/8wX570rfy9zMN9hWtRhVy327Du+HAuFmq
 j434ocS2jn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; 
   d="scan'208";a="468403031"
Received: from aprakasa-mobl.amr.corp.intel.com (HELO [10.254.67.245]) ([10.254.67.245])
  by fmsmga005.fm.intel.com with ESMTP; 26 May 2020 11:31:55 -0700
Subject: Re: [Sound-open-firmware] [PATCH 5/6] vhost: add an rpmsg API
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <20200516101109.2624-1-guennadi.liakhovetski@linux.intel.com>
 <20200516101109.2624-6-guennadi.liakhovetski@linux.intel.com>
 <9737e3f2-e59c-0174-9254-a2d8f29f30b7@linux.intel.com>
 <20200525135336.GB6761@ubuntu>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <59029e07-f49b-8d1a-4eb4-2f6d5775cf54@linux.intel.com>
Date:   Tue, 26 May 2020 13:30:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525135336.GB6761@ubuntu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 5/25/20 8:53 AM, Guennadi Liakhovetski wrote:
> Hi Pierre,
> 
> On Sat, May 16, 2020 at 12:00:35PM -0500, Pierre-Louis Bossart wrote:
>>
>>> +config VHOST_RPMSG
>>> +	tristate
>>> +	depends on VHOST
>>
>> depends on RPMSG_VIRTIO?
> 
> No, RPMSG_VIRTIO is used on the guest side, VHOST_RPMSG (as well as
> all other vhost drivers) on the host side.

I vaguely recalled something about sockets, and was wondering if there 
isn't a dependency on this:

config VHOST_VSOCK
	tristate "vhost virtio-vsock driver"
	depends on VSOCKETS && EVENTFD && VHOST_DPN
	select VHOST

