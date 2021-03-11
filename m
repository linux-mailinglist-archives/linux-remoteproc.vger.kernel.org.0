Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206FD33817E
	for <lists+linux-remoteproc@lfdr.de>; Fri, 12 Mar 2021 00:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbhCKXcc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 11 Mar 2021 18:32:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhCKXcC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 18:32:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6FF3B64FA3;
        Thu, 11 Mar 2021 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615505522;
        bh=xYzc1E5s5yTfc7/34iUHr/qIxPwKuPOm/XsGzWtt1AE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BpeKcW6d4o6rE6QWdDtHtKpSo1EBKFDiWKJFKLzRJZJKLU4O50xMY4iPf7ey459Ct
         /KmoGZ44v+iP0kBjtfESqQ5UJGAnXFBpoamtM05t6OCPQW/Qp2so01xzftTXfQcOGK
         T/6CTlNCRiaSfbs+Fopt21WsOS7WsZ0UxSBzLc3mgZjBye9SIsfdP3euFyAa4eCIuT
         X1f7cJ6pgnfGT1fk32wKyZNzQPdLK1kmQmQMUSd7QX//sMQXttVmLUHqxNQ6Yh38tK
         pvbdCy5DBCIL0oe28mufGjWHuFnpVrY7nGyHQlGF9tPjZV+s/uMdQu/z1OnwNsJhHw
         bRtJcBm6j4WoA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6009C609E7;
        Thu, 11 Mar 2021 23:32:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: qcom_glink_native: fix error return code of
 qcom_glink_rx_data()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161550552238.25923.14991588824258170071.git-patchwork-notify@kernel.org>
Date:   Thu, 11 Mar 2021 23:32:02 +0000
References: <20210306133624.17237-1-baijiaju1990@gmail.com>
In-Reply-To: <20210306133624.17237-1-baijiaju1990@gmail.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sat,  6 Mar 2021 05:36:24 -0800 you wrote:
> When idr_find() returns NULL to intent, no error return code of
> qcom_glink_rx_data() is assigned.
> To fix this bug, ret is assigned with -ENOENT in this case.
> 
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> 
> [...]

Here is the summary with links:
  - rpmsg: qcom_glink_native: fix error return code of qcom_glink_rx_data()
    https://git.kernel.org/andersson/remoteproc/c/d9a69846241c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


