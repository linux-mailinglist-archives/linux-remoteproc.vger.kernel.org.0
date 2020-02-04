Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9ABE15152D
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Feb 2020 06:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbgBDFAF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Feb 2020 00:00:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:36942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbgBDFAF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Feb 2020 00:00:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580792404;
        bh=YZpce+5dNcsi9/6tit8kn+qAtJyIBTh1R1qvWwvrP/Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=txZbwFo6Pqhf0FRTW3Nv7PiKw6MJCz1qe3C2D2U8452vt8I++uSJDIzs0Y3d2hnRR
         FCYXaZ9RWfcYIREU4hWg3TlFPk/qIQQab6C5DH6839sdvTAcwIFte5Rj3Sxe9KpSgE
         ex+4J7Yy+pXPxNFksMKSLhDOqQJxDHtIVth3qXzM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Improve general readability of MSS on SC7180
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158079240449.22181.11242000476784871582.git-patchwork-notify@kernel.org>
Date:   Tue, 04 Feb 2020 05:00:04 +0000
References: <20200123131236.1078-1-sibis@codeaurora.org>
In-Reply-To: <20200123131236.1078-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu, 23 Jan 2020 18:42:34 +0530 you wrote:
> This series aims to improve the general readability of the mss reset
> sequence on SC7180 SoCs. No functional change intended.
> 
> v2:
>  * Use regmap_read_poll_timeout for halt_nav and halt_axi
>  * Redefine CONN_BOX_SPARE_0 to AXI_GATING_VALID_OVERRIDE
>  * Update more details about pipeline glitch issue
>  * Drop 2,3 patches from v1
> 
> [...]


Here is a summary with links:
  - [v2,1/2] remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
    https://git.kernel.org/andersson/remoteproc/c/01bf3fec38e9188846f6755cd29da515f5852bc5
  - [v2,2/2] remoteproc: qcom: q6v5-mss: Improve readability of reset_assert
    https://git.kernel.org/andersson/remoteproc/c/600c39b34369e2a1bf78eb67afb99ce550f271cc

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
