Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4130D35EABC
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Apr 2021 04:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236976AbhDNCUo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 13 Apr 2021 22:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:46700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237657AbhDNCUd (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 22:20:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1EC40613C4;
        Wed, 14 Apr 2021 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618366811;
        bh=KZBVTptfw1k5aD/8vns0ZBSVEqmjc6X2YKMWFr6ruaY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GYFUrAszwz25bQQX4pg/crm4OyOowBBg/z42I7uvZA6nzp5F5Z0Enzmta8TQkrNJE
         5bxxtRJX/YNg2XHFeVFJwMPmSPt0Q7ttUPo0XPxhGCm1u//a4fyWpss/AbBMc9c4qi
         ADDr8lJdYFiNBDEhs+1x73uA0jwsPeo10ufivxS13XBaHJcN3+q7xFjxN4ePSb3sWB
         +hXaXwlzCjmVZBeIB+oLPF8hhJVRPu6Q2PTCVAKrr77+VfyOdfPUm1nOLpsVboo1Oa
         f10K9VHu3zC/AQTrKE4/6HuvcaHU8DkIiRxteq/oIUpV+5W4g5kX+L0F/077bXPD3e
         74F6xC43IYhFg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1658B609B9;
        Wed, 14 Apr 2021 02:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] remoteproc: qcom: wcss: Fix return value check in
 q6v5_wcss_init_mmio()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161836681108.7360.12823293480396429826.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Apr 2021 02:20:11 +0000
References: <20210319094100.4185044-1-weiyongjun1@huawei.com>
In-Reply-To: <20210319094100.4185044-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 19 Mar 2021 09:41:00 +0000 you wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should
> be replaced with NULL test.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] remoteproc: qcom: wcss: Fix return value check in q6v5_wcss_init_mmio()
    https://git.kernel.org/andersson/remoteproc/c/859fd2418b4b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


