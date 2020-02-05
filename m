Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43E93152920
	for <lists+linux-remoteproc@lfdr.de>; Wed,  5 Feb 2020 11:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbgBEK3S (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 5 Feb 2020 05:29:18 -0500
Received: from wsip-184-185-158-229.sd.sd.cox.net ([184.185.158.229]:27416
        "EHLO s0-postfix.allcaps.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727771AbgBEK3S (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Feb 2020 05:29:18 -0500
X-Greylist: delayed 310 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Feb 2020 05:29:18 EST
Received: from MacBook-Pro.local (ip68-7-58-241.sd.sd.cox.net [68.7.58.241])
        by s0-postfix.allcaps.org (Postfix) with ESMTPSA id 586D51C64046
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 Feb 2020 01:13:44 -0800 (PST)
To:     linux-remoteproc@vger.kernel.org
From:   "Andrew P. Lentvorski" <bsder@allcaps.org>
Subject: How to get src and dst for pru_rpmsg_send?
Autocrypt: addr=bsder@allcaps.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f22d9305-326f-f584-4480-9509c5f903fb@allcaps.org>
Date:   Wed, 5 Feb 2020 02:24:07 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

I seem to be missing something obvious: Where do I get the values for
src and dst in the pru_rpmsg_send() function?

The TI examples do a pru_rpmsg_receive() first and then echo back to the
same src and dst.  That seems ... odd.  What's the point of having a
variable src and dst if they are effectively hardwired to a single
communication channel?

Thanks.
