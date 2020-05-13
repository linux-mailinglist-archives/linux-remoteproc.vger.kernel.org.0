Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD46B1D070D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 May 2020 08:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgEMGUH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 02:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729133AbgEMGUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 02:20:07 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589350806;
        bh=i0+3etaKy+HJhfwbAckxZm+L3jUIyXx8B08Fy+9iUnY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XvTLQNnfAWNx7VvHGsk0V+V32L0sHXBbvX/yMrP19+JQNKN/qCAvCmLmnoK/xPhO2
         MCO7hnIxDL4dxIm4tRBGtqJsfH1/5tTasl5BU9JNpSg5rNpnSOQSeS8tqJWZf2RRxR
         Efr3VZqS4Cq0XLmCvTzm//6x8WgDbko33Yv3xDgc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Drop all accesses to MPSS PERPH register space
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158935080691.26945.8757289230451414699.git-patchwork-notify@kernel.org>
Date:   Wed, 13 May 2020 06:20:06 +0000
References: <20200415145110.20624-1-sibis@codeaurora.org>
In-Reply-To: <20200415145110.20624-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 15 Apr 2020 20:21:08 +0530 you wrote:
> 7C retail devices using MSA based boot will result in a fuse combination
> which will prevent accesses to MSS PERPH register space where the mpss
> clocks and halt-nav reside. Hence requesting a halt-nav as part of the
> SSR sequence will result in a NoC error. Issuing HALT NAV request and
> turning on the mss clocks as part of SSR will no longer be required
> since the modem firmware will have the necessary fixes to ensure that
> there are no pending NAV DMA transactions thereby ensuring a smooth
> SSR.
> 
> [...]


Here is a summary with links:
  - [1/2] dt-bindings: remoteproc: qcom: Replace halt-nav with spare-regs
    https://git.kernel.org/andersson/remoteproc/c/e62e3acd61d36b07878cd33a868a5797fe1e25b5
  - [2/2] remoteproc: qcom_q6v5_mss: Drop accesses to MPSS PERPH register space
    https://git.kernel.org/andersson/remoteproc/c/a9fdc79d488623d36341f0f3d08f5aa1bedb9d53

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
